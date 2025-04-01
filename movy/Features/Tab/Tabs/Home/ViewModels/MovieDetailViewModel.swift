//
//  MovieDetailViewModel.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 31/03/2025.
//

import SwiftUI

class MovieDetailViewModel: ObservableObject {

    init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
    }

    // MARK: Private

    private var coordinator: HomeCoordinator

    // MARK: Static

    static func mock() -> MovieDetailViewModel {
        MovieDetailViewModel(coordinator: .init())
    }
}

