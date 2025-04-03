//
//  Movie.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 30/03/2025.
//

import Foundation

struct Movie: Identifiable, Decodable {
    let id = UUID()
    let title: String
    let imageName: String
    
    init(from character: MarvelCharacter) {
        self.title = character.name
        self.imageName = character.thumbnail.imageURL(withFilename: "portrait_medium")?.absoluteString ?? ""
    }

//    static func MoviesMocked() -> [Movie] { // TODO Load from the api
//        return [
//            Movie(title: "YOU", imageName: "you_movie"),
//            Movie(title: "SEX EDUCATION", imageName: "sex_education_movie"),
//            Movie(title: "TIDYING UP", imageName: "tidyingup_movie"),
//            Movie(title: "BIRD BOX", imageName: "birdbox_movie")
//        ]
//    }
}
