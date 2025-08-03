//
//  SoundController.swift
//  nanohist
//
//  Created by Tiago Prestes on 02/08/25.
//

import Foundation
import AVFoundation

class SoundController {
    static let manager = SoundController()
    private var player: AVAudioPlayer?

    private init() {}
    
    func playSound(fileName: String, format: String, volume: Float = 0.5) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: format) else {
            print("File not found")
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.volume = volume
            player?.play()
        } catch {
            print("Failed to play sound: \(error)")
        }
    }
}
