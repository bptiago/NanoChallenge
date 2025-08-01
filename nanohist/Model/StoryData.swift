//
//  StoryData.swift
//  nanohist
//
//  Created by Tiago Prestes on 01/08/25.
//

import Foundation

enum ScenesEnum {
    case livingRoom
    case stairs
    case hallway
    case basement
}

struct StoryData {
    static let nodes: [ScenesEnum: StoryNode] = [
        .livingRoom: .init(dialog: ["hello"], image: "room", directions: [.forward]),
        .hallway: .init(dialog: ["pqp"], image: "hallway", directions: [.forward, .backward])
    ]
}
