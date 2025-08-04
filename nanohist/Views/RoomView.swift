//
//  RoomView.swift
//  nanohist
//
//  Created by Tiago Prestes on 01/08/25.
//

import SwiftUI

struct RoomView: View {
    @EnvironmentObject var storyData: StoryData
    var storyNode: StoryNode
    
    var body: some View {
        ZStack {
            Image(storyNode.image)
                .resizable()
                .scaledToFit()
            if storyNode.image == "stairs" && storyData.isGameFinished {
                HStack {
                    Spacer()
                    
                    Image(.tupac)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 155, height: 155)
                        .offset(x: -8, y: -77)
                }
            }
        }
        .ignoresSafeArea()
    }
}

//#Preview {
//    RoomView()
//}
