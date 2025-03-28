//
//  SignupViewModel.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 24/03/2025.

import SwiftUI

class SignupViewModel: ObservableObject {
    
    // MARK: Public
    
    init(coordinator: OnboardingCoordinator) {
        self.coordinator = coordinator
    }
    
    func continueToNextStep() {
        // TODO: Coordinator finish onboarding
    }
    
    func showSignup() {
        coordinator.pop()
    }
    
    // MARK: Private
    
    private var coordinator: OnboardingCoordinator
    
    // MARK: Static
    
    static func mock() -> SignupViewModel {
        SignupViewModel(coordinator: .init())
    }
}
