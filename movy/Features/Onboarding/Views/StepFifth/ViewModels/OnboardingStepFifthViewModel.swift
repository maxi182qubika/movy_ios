// Created by Bruno Martinez on 9/3/25.

import SwiftUI

class OnboardingStepFifthViewModel: ObservableObject {
    
    // MARK: Public

    let title: String
 
    init(coordinator: OnboardingCoordinator, page: OnboardingPage) {
        self.coordinator = coordinator
        self.title = page.name
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
        OnboardingStepFifthViewModel(coordinator: .init(), page: .step5)
    }
}
