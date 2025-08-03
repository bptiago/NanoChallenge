//
//  PhoneController.swift
//  nanohist
//
//  Created by Tiago Prestes on 01/08/25.
//

import SwiftUI

struct PhoneController: View {
    @EnvironmentObject var storyData: StoryData
    @State var isShowing = false
    
    @State var message: String = ""
    @State var answer: String = ""
    
    @State var narrationCounter: Int = 0
    var narrationMessage: DialogueLine {
        storyData.texts[narrationCounter]
    }
    
    var typeField: some View {
        TextField("", text: $answer, axis: .vertical)
            .foregroundStyle(.white)
            .textInputAutocapitalization(.never)
    }
    
    var body: some View {
        VStack {
            Spacer()
            HStack(alignment: .bottom) {
                
                if isShowing {
                    ZStack {
                        Rectangle()
                        
                        VStack {
                            Text(message)
                                .foregroundStyle(.white)
                            
                            if narrationMessage.awaitsInput {
                                typeField
                            }

                        }
                    }
                    .transition(.move(edge: .bottom))
                    .frame(width: 100, height: 200)
                    .onTapGesture {
                        narrationMessage.awaitsInput ? checkAnswer() : nextMessage()
                    }
                }
                
                Spacer()
                
                Rectangle()
                    .frame(width: 100, height: 100)
            }
        }
        .onAppear() {
            Task {
                sleep(2)
                receiveMessage()
            }
        }
        
        .onTapGesture {
            withAnimation {
                isShowing.toggle()
            }
        }
    }
    
    func receiveMessage() {
        withAnimation {
            isShowing = true
        }
        
        message = narrationMessage.text
                
        SoundController.manager.playSound(fileName: "phonebuzz", format: "wav", volume: 2.0)
    }
    
    func nextMessage() {
        if narrationCounter >= storyData.texts.count - 1 {
            return
        }
        
        narrationCounter += 1
        receiveMessage()
    }
    
    func checkAnswer() {
        if answer == narrationMessage.answer {
            nextMessage()
            answer = ""
        }
    }
}
