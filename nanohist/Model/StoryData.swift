//
//  StoryData.swift
//  nanohist
//
//  Created by Tiago Prestes on 01/08/25.
//

import Foundation

enum SceneKey: String, Codable {
    case livingRoom
    case stairs
    case basement
}

struct DialogueLine: Codable {
    let text: String
    let awaitsInput: Bool
    let answer: String?
}

struct StoryNode: Codable {
    var dialog: [DialogueLine]
    var image: String
    var directions: [Directions]
}

class StoryData: ObservableObject {
    var isGameFinished: Bool = false
    
    var nodes: [SceneKey: StoryNode] {
        let json = loadFile("Story")
        return decodeScenes(json)
    }
    
    var texts: [DialogueLine] {
        let json = loadFile("PhoneTexts")
        return decodePhoneTexts(json)
    }
    
    func loadFile(_ file: String, type: String = "json") -> Data {
        guard let url = Bundle.main.url(forResource: file, withExtension: "json") else {
            fatalError("Failed to locate \(file) in bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load file from \(file) from bundle")
        }
        
        return data
    }
    
    func decodeScenes(_ data: Data) -> [SceneKey: StoryNode] {
        let decoder = JSONDecoder()
        
        do {
            let rawData = try decoder.decode([String: StoryNode].self, from: data)
            
            var result: [SceneKey: StoryNode] = [:]
            for (key, value) in rawData {
                guard let sceneKey = SceneKey(rawValue: key) else {
                    fatalError("Unknown scene key: \(key)")
                }
                result[sceneKey] = value
            }
            
            return result
        } catch {
            fatalError("Failed to decode JSON: \(error)")
        }
    }
    
    func decodePhoneTexts(_ data: Data) -> [DialogueLine] {
        let decoder = JSONDecoder()
        
        do {
            let data = try decoder.decode([DialogueLine].self, from: data)
            return data
        } catch {
            fatalError("Failed to decode JSON: \(error)")
        }
    }
    
}
