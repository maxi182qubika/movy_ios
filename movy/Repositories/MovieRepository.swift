//
//  MovieRepository.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 02/04/2025.
//

import Combine
import Foundation


enum MovieRepositoryError: Error {
    case invalidResponse
    case apiError(String)
}

protocol MovieRepositoryProtocol {
    func getMovies(with apikey: String, hash: String) async throws -> [MarvelCharacter]
}

final class MovieRepository: MovieRepositoryProtocol {
    
    private let apiClient: APIClientProtocol

    init(apiClient: APIClientProtocol = APIClient.shared) {
        self.apiClient = apiClient
    }

    func getMovies(with apikey: String, hash: String) async throws -> [MarvelCharacter] {
        let task = await apiClient.fetchMovies()
        let response = try await task.value

        guard let movies = response.data?.results else {
            throw MovieRepositoryError.invalidResponse
        }

        return movies
    }
}
