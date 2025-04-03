//
//  HomeViewModel.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 30/03/2025.
//


import SwiftUI

class HomeViewModel: ObservableObject {

    // MARK: Public
    @Published var movies: [Movie] = []
    private let apiClient: APIClientProtocol

 
    init(coordinator: HomeCoordinator, apiClient: APIClientProtocol = APIClient.shared) {
        self.coordinator = coordinator
        self.apiClient = apiClient
    }
 
    func openInfo() {
        coordinator.push(page: .info)
    }
    
    func loadMovies() async {
        do {
            let fetchedCharacters = try await getMarvelCharacters()
            let characterToMovies = fetchedCharacters.map { Movie(from: $0) }

            movies = characterToMovies
            print(characterToMovies)
        } catch {
            print("Failed to fetch movies: \(error)")
        }
    }
  
    func showMovieDetail(id: UUID) {
      coordinator.push(page: .movieDetail(id: id))
    }
    
    func getMarvelCharacters() async throws -> [MarvelCharacter] {
        let task = await apiClient.fetchMovies()
        let response = try await task.value
 
        guard let movies = response.data?.results else {
            throw MovieRepositoryError.invalidResponse
        }
        print(movies)

        return movies
    }

    // MARK: Private

    private var coordinator: HomeCoordinator

    // MARK: Static

    static func mock() -> HomeViewModel {
        HomeViewModel(coordinator: .init())
    }
}
