//
//  PhoneController.swift
//  nanohist
//
//  Created by Tiago Prestes on 01/08/25.
//

import SwiftUI

struct PhoneController: View {
    @State var isInputEnabled = false
    @State var isShowing = false
    @State var message: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            HStack(alignment: .bottom) {
                
                if isShowing {
                    ZStack {
                        Rectangle()
                            .transition(.move(edge: .bottom).combined(with: .opacity))
                        
                        TextField("", text: $message, axis: .vertical)
                            .foregroundStyle(.white)
                            .textInputAutocapitalization(.never)
                            .disabled(!isInputEnabled)
                    }
                    .frame(width: 100, height: 200)
                    
                    .onTapGesture {
                        checkAnswer()
                    }
                }
                
                Spacer()
                
                Rectangle()
                    .frame(width: 100, height: 100)
            }
        }
        .onTapGesture {
            withAnimation {
                isShowing.toggle()
            }
        }
    }
    
    func receiveMessage(_ message: String, shouldAllowAnswer: Bool = false) {
        withAnimation {
            isShowing = true
        }
        
        self.message = message
        
        isInputEnabled = shouldAllowAnswer
        
        SoundController.manager.playSound(fileName: "phonebuzz", format: "wav", volume: 2.5)
    }
    
    func checkAnswer() {
        if message == "asd123" {
            isInputEnabled = false
            receiveMessage("Correct!")
        }
    }
}

#Preview {
    PhoneController()
}
