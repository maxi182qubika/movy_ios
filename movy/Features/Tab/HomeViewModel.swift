//
//  HomeViewModel.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 26/03/2025.
//


import SwiftUI

class HomeViewModel: ObservableObject {
    
    // MARK: Public
    
    init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
    }
    
    func openInfo() {
        coordinator.push(page: .info)
    }
    
    // MARK: Private
    
    private var coordinator: HomeCoordinator

    // MARK: Static
    
    static func mock() -> HomeViewModel {
        HomeViewModel(coordinator: .init(screenType: .home))
    }
}
