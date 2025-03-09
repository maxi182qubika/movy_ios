// Created by Bruno Martinez on 9/3/25.

import SwiftUI

class OnboardingStepFifthViewModel: ObservableObject {
    
    // MARK: Public

    let title = "Step 5"

    init(coordinator: OnboardingCoordinator) {
        self.coordinator = coordinator
    }
    
    func continueToNextStep() {
        coordinator.push(page: .step6)
    }
    
    func showLogin() {
        coordinator.showLogin()
    }
    
    // MARK: Private
    
    private var coordinator: OnboardingCoordinator

    
    // MARK: Static
    
    static func mock() -> OnboardingStepFifthViewModel {
        OnboardingStepFifthViewModel(coordinator: .init())
    }
}
