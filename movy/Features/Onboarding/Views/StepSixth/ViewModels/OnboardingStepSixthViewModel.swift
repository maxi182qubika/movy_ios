// Created by Bruno Martinez on 9/3/25.

import SwiftUI

class OnboardingStepSixthViewModel: ObservableObject {
    
    // MARK: Public
    
    let title = "Step 6"

    init(coordinator: OnboardingCoordinator) {
        self.coordinator = coordinator
    }
    
    func continueToNextStep() {
        // TODO: Coordinator finish onboarding
    }
    
    func showLogin() {
        coordinator.showLogin()
    }
    
    // MARK: Private
    
    private var coordinator: OnboardingCoordinator
    
    // MARK: Static
    
    static func mock() -> OnboardingStepSixthViewModel {
        OnboardingStepSixthViewModel(coordinator: .init())
    }
}
