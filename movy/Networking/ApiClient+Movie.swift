//
//  ApiClient+Movie.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 02/04/2025.
//

import Foundation

extension APIClient {
    func fetchMovies() async -> Task<MarvelResponse, Error> {
        request(MovieRoute.fetchMovies)
    }
}
