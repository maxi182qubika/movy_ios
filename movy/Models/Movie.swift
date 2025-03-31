//
//  Movie.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 30/03/2025.
//

import Foundation

struct Movie: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String

    static func MoviesMocked() -> [Movie] { // TODO Load from the api
        return [
            Movie(title: "YOU", imageName: "you_movie"),
            Movie(title: "SEX EDUCATION", imageName: "sex_education_movie"),
            Movie(title: "TIDYING UP", imageName: "tidyingup_movie"),
            Movie(title: "BIRD BOX", imageName: "birdbox_movie")
        ]
    }
}
