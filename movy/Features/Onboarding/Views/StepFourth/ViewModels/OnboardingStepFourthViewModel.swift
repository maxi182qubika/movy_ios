// Created by Bruno Martinez on 9/3/25.

import SwiftUI

class OnboardingStepFourthViewModel: ObservableObject {
    
    // MARK: Public
    @Published var username: String = "" {
        didSet { validateEmail() }
    }
    @Published var password: String = ""
    @Published var emailError: String?
 
    
    let title: String

    init(coordinator: OnboardingCoordinator, page: OnboardingPage) {
        self.coordinator = coordinator
        self.title = page.name
    }
    
    private func validateEmail() {
        if username.isEmpty {
            emailError = nil
        } else {
            emailError = ValidationUtils.isValidEmail(username) ? nil : "Invalid email"
        }
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
        OnboardingStepFourthViewModel(coordinator: .init(), page: .step4)
    }
}
