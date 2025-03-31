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
        loadMovies() 
    }

    func openInfo() {
        coordinator.push(page: .info)
    }
    
    func loadMovies() {
        movies = Movie.MoviesMocked()
    }

    // MARK: Private

    private var coordinator: HomeCoordinator

    // MARK: Static

    static func mock() -> HomeViewModel {
        HomeViewModel(coordinator: .init())
    }
}
