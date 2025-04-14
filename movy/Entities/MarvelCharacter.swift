//
//  MarvelCharacter.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 02/04/2025.
//

import Foundation

struct MarvelCharacter: Codable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: Thumbnail
}

struct Thumbnail: Codable {
    let path: String
    let fileExtension: String

    enum CodingKeys: String, CodingKey {
        case path
        case fileExtension = "extension"
    }
    
    func imageURL(withFilename imageSize: String) -> URL? {
        var securePath = path
        if securePath.hasPrefix("http://") {
            securePath = securePath.replacingOccurrences(of: "http://", with: "https://")
        }
        
        let fullPath = "\(securePath)/\(imageSize).\(fileExtension)"
        return URL(string: fullPath)
    }
}
