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

 
    init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
    }

    func openInfo() {
        coordinator.push(page: .info)
    }
    
    func loadMovies() {
        movies = Movie.MoviesMocked()
    }
  
    func showMovieDetail(id: UUID) {
      coordinator.push(page: .movieDetail(id: id))
    }

    // MARK: Private

    private var coordinator: HomeCoordinator

    // MARK: Static

    static func mock() -> HomeViewModel {
        HomeViewModel(coordinator: .init())
    }
}
