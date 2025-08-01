//
//  HallwayView.swift
//  nanohist
//
//  Created by Tiago Prestes on 01/08/25.
//

import SwiftUI

struct HallwayView: View {
    var storyNode: StoryNode
    
    var body: some View {
        ZStack {
            Image(storyNode.image)
                .resizable()
            
        }
    }
}
