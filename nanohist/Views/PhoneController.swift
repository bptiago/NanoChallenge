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
            .foregroundStyle(.black)
            .textInputAutocapitalization(.never)
            .font(.custom("Star4", size: 14))
    }
    
    var body: some View {
        VStack {
            Spacer()
            HStack(alignment: .bottom) {
                
                Image(.phoneflip)
                    .resizable()
                    .frame(width: 80, height: 80)
                
                Spacer()
                
                if isShowing {
                    ZStack {
                        Image(.phone)
                            .resizable()
                            .scaledToFit()
                        
                        VStack(alignment: .leading) {
                            Text(message)
                                .font(.custom("Star4", size: 14))
                                .foregroundStyle(.black)
                            
                            if narrationMessage.awaitsInput {
                                typeField
                            }
                            
                        }
                        .frame(width: 130)
                        .offset(x: 25, y: -10)
                        .rotationEffect(.degrees(11.5))
                    }
                    .frame(width: 300)
                    .transition(.move(edge: .bottom))
                    .onTapGesture {
                        narrationMessage.awaitsInput ? checkAnswer() : nextMessage()
                    }
                }
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
        
        if narrationCounter >= storyData.texts.count - 1 {
            storyData.isGameFinished = true
        }
    }
    
    func nextMessage() {
        if narrationCounter >= storyData.texts.count - 1 {
            return
        }
        
        narrationCounter += 1
        receiveMessage()
    }
    
    func checkAnswer() {
        let _answer = answer.lowercased()
        
        if _answer.isEmpty {
            return
        }
        
        if _answer.contains(narrationMessage.answer!.lowercased()) {
            nextMessage()
            answer = ""
        } else {
            answer = "Try again:"
        }
    }
}
