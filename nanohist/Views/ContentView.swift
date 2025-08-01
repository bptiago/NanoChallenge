//
//  ContentView.swift
//  nano
//
//  Created by Tiago Prestes on 01/08/25.
//

import SwiftUI

struct ContentView: View {
    @State var sceneCounter: Int = 0
    @State var scene: ScenesEnum = .livingRoom
    
    var body: some View {
        ZStack {
            switch scene {
            case .livingRoom:
                RoomView(storyNode: StoryData.nodes[scene]!)
            case .stairs:
                RoomView(storyNode: StoryData.nodes[scene]!)
            case .hallway:
                HallwayView(storyNode: StoryData.nodes[scene]!)
            case .basement:
                RoomView(storyNode: StoryData.nodes[scene]!)
            }
            
            SceneControllers(scene: $scene, sceneCounter: $sceneCounter)
            PhoneController()
                .ignoresSafeArea(.container, edges: .bottom)

        }
    }
}

#Preview {
    ContentView()
}
