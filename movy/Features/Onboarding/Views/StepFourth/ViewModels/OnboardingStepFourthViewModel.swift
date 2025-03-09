// Created by Bruno Martinez on 9/3/25.

import SwiftUI

class OnboardingStepFourthViewModel: ObservableObject {
    
    // MARK: Public
    
    let title = "Step 4"

    init(coordinator: OnboardingCoordinator) {
        self.coordinator = coordinator
    }
    
    func continueToNextStep() {
        coordinator.push(page: .step5)
    }
    
    func showLogin() {
        coordinator.showLogin()
    }
    
    // MARK: Private
    
    private var coordinator: OnboardingCoordinator

    
    // MARK: Static
    
    static func mock() -> OnboardingStepFourthViewModel {
        OnboardingStepFourthViewModel(coordinator: .init())
    }
}
