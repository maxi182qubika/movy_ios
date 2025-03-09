// Created by Bruno Martinez on 9/3/25.

import SwiftUI

class OnboardingStepThirdViewModel: ObservableObject {
    
    // MARK: Public
    
    let title = "Step 3"

    init(coordinator: OnboardingCoordinator) {
        self.coordinator = coordinator
    }
    
    func continueToNextStep() {
        coordinator.push(page: .step4)
    }

    func showLogin() {
        coordinator.showLogin()
    }
    
    // MARK: Private
    
    private var coordinator: OnboardingCoordinator

    
    // MARK: Static
    
    static func mock() -> OnboardingStepThirdViewModel {
        OnboardingStepThirdViewModel(coordinator: .init())
    }
}
