//
//  ContentView.swift
//  nano
//
//  Created by Tiago Prestes on 01/08/25.
//

import SwiftUI

struct ContentView: View {
    @State var sceneCounter: Int = 0
    @State var scene: SceneKey = .livingRoom
    private let storyData = StoryData()
    
    var body: some View {
        ZStack {
            RoomView(storyNode: storyData.nodes[scene]!)
                .environmentObject(storyData)
            
            SceneController(scene: $scene, sceneCounter: $sceneCounter)
                .environmentObject(storyData)
                .safeAreaPadding(.vertical)

            PhoneController()
                .environmentObject(storyData)
                .safeAreaPadding(.horizontal, 40)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
