// Created by Bruno Martinez on 9/3/25.

import SwiftUI

class OnboardingStepOneViewModel: ObservableObject {
    
    // MARK: Public
    
    let title = "Step 1"

    init(coordinator: OnboardingCoordinator) {
        self.coordinator = coordinator
    }
    
    func continueToNextStep() {
        coordinator.push(page: .step2)
    }
    
    func showLogin() {
        coordinator.showLogin()
    }
    
    // MARK: Private
    
    private var coordinator: OnboardingCoordinator

    
    // MARK: Static
    
    static func mock() -> OnboardingStepOneViewModel {
        OnboardingStepOneViewModel(coordinator: .init())
    }
}
