//
//  RoomView.swift
//  nanohist
//
//  Created by Tiago Prestes on 01/08/25.
//

import SwiftUI

struct RoomView: View {
    var storyNode: StoryNode
    
    var body: some View {
        ZStack {
            Image(storyNode.image)
                .resizable()
            
        }
    }
}

//#Preview {
//    RoomView()
//}
