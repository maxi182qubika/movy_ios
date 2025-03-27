//
//  SearchViewModel.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 26/03/2025.
//

import SwiftUI

class SearchViewModel: ObservableObject {
    
    // MARK: Public
    
    init(coordinator: TabsCoordinator) {
        self.coordinator = coordinator
    }
    
    func continueToNextStep() {
        // TODO: Coordinator finish onboarding
    }
    
    // MARK: Private
    
    private var coordinator: TabsCoordinator
    
    // MARK: Static
    
    static func mock() -> SearchViewModel {
        SearchViewModel(coordinator: .init())
    }
}
