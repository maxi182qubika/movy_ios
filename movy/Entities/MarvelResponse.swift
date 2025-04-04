//
//  MarvelResponse.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 02/04/2025.
//

import Foundation

struct MarvelResponse: Codable {
    let code: Int
    let status: String
    let copyright: String
    let attributionText: String
    let attributionHTML: String
    let etag: String
    let data: MarvelData?
}
