//
//  SceneControllers.swift
//  nanohist
//
//  Created by Tiago Prestes on 01/08/25.
//

import SwiftUI

enum Directions: String, Codable {
    case forward
    case backward
}

struct SceneController: View {
    @EnvironmentObject var storyData: StoryData
    @Binding var scene: SceneKey
    @Binding var sceneCounter: Int
    
    var storyNode: StoryNode {
        storyData.nodes[scene]!
    }
    
    var body: some View {
        VStack {
            ForEach(storyNode.directions, id: \.self) { direction in
                
                if storyNode.directions.count == 1 && direction == .backward {
                    Spacer()
                }
                
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
            scene = .stairs
        case 2:
            scene = .basement
        default:
            break
        }
    }
}
