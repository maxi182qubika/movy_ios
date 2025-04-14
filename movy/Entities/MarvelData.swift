//
//  MarvelData.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 02/04/2025.
//

import Foundation

struct MarvelData: Codable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [MarvelCharacter]?
}
