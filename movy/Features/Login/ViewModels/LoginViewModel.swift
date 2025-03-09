// Created by Bruno Martinez on 9/3/25.

import SwiftUI

class LoginViewModel: ObservableObject {
    
    // MARK: Public


    init(coordinator: OnboardingCoordinator) {
        self.coordinator = coordinator
    }
    
    func continueToNextStep() {
        coordinator.push(page: .step6)
    }
    
    // MARK: Private
    
    private var coordinator: OnboardingCoordinator

    
    // MARK: Static
    
    static func mock() -> OnboardingStepFifthViewModel {
        OnboardingStepFifthViewModel(coordinator: .init())
    }
}
