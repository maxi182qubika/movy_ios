// Created by Bruno Martinez on 9/3/25.

import SwiftUI

class OnboardingStepSixthViewModel: ObservableObject {
    
    // MARK: Public
    @Published var cardHolderName: String = ""
    @Published var cardHolderLastName: String = ""
    @Published var cardNumber: String = ""
    @Published var emptyText: String = ""
    @Published var cvvError: String?
    
    @Published var cvv: String = ""
 
    let title: String

    init(coordinator: OnboardingCoordinator, page: OnboardingPage) {
        self.coordinator = coordinator
        self.title = page.name
    }
    
    func validateCvv() {
      if cvv.count > 4 {
          cvv = String(cvv.prefix(4))
      } else {
        if cvv.isEmpty {
            cvvError = nil
        } else {
            cvvError = ValidationUtils.isValidCvv(cvv) ? nil : "Invalid CVV"
        }
      }
    }
    
    func finishOnboarding() {
        
    }
    
    func continueToNextStep() {
        // TODO: Coordinator finish onboarding
    }
    
    func backToSelectPlanStep() {
        coordinator.push(page: .step2)
    }
    
    func showLogin() {
        coordinator.showLogin()
    }
    
    // MARK: Private
    
    private var coordinator: OnboardingCoordinator
    
    // MARK: Static
    
    static func mock() -> OnboardingStepSixthViewModel {
        OnboardingStepSixthViewModel(coordinator: .init(), page: .step6)
    }
}
