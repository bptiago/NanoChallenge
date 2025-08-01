//
//  SceneControllers.swift
//  nanohist
//
//  Created by Tiago Prestes on 01/08/25.
//

import SwiftUI

enum DirectionsEnum {
    case forward
    case backward
}

struct SceneControllers: View {
    @Binding var scene: ScenesEnum
    @Binding var sceneCounter: Int
    
    var storyNode: StoryNode {
        StoryData.nodes[scene]!
    }
    
    var body: some View {
        VStack {
            ForEach(storyNode.directions, id: \.self) { direction in
                Button {
                    switch direction {
                    case .forward:
                        sceneCounter += 1
                    case .backward:
                        sceneCounter -= 1
                    }
                    
                    updateScene()
                } label: {
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 50, height: 50)
                }
                if direction == .forward {
                    Spacer()
                }
            }
        }
    }
    
    func updateScene() {
        switch sceneCounter {
        case 0:
            scene = .livingRoom
        case 1:
            scene = .hallway
        default:
            break
        }
    }
}
