//
//  ContentView.swift
//  nano
//
//  Created by Tiago Prestes on 01/08/25.
//

import SwiftUI

// TODO: UNIR FUNÇÕES CLASSES QUE MEXEM COM ARQUIVOS (SOUNDCONTROLLER E STORY DATA)

struct ContentView: View {
    @State var sceneCounter: Int = 0
    @State var scene: SceneKey = .livingRoom
    private let storyData = StoryData()
    
    var body: some View {
        ZStack {
            switch scene {
            case .livingRoom:
                RoomView(storyNode: storyData.nodes[scene]!)
            case .stairs:
                RoomView(storyNode: storyData.nodes[scene]!)
            case .basement:
                RoomView(storyNode: storyData.nodes[scene]!)
            }
            
            SceneController(scene: $scene, sceneCounter: $sceneCounter)
                .environmentObject(storyData)

            PhoneController()
                .environmentObject(storyData)
                .safeAreaPadding(.horizontal)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
