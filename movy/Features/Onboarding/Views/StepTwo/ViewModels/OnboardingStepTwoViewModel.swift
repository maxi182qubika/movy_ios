// Created by Bruno Martinez on 9/3/25.

import SwiftUI

class OnboardingStepTwoViewModel: ObservableObject {
    
    // MARK: Public
    @Published var selectedPlan: PlanType =  .basic
    let title = "Step 2"
    let planFeatures: [PlanFeature] = [
        .init(title: "HD Disponible", featureKey: \.isHD),
        .init(title: "Ultra HD Disponible", featureKey: \.isUltraHD),
        .init(title: "Pantallas en las que puedes ver al mismo tiempo", featureKey: \.isMultipleScreen),
        .init(title: "Ve en tu laptop, TV, teléfono y tablet", featureKey: \.isAvailableMobile),
        .init(title: "Películas y programas de TV ilimitados", featureKey: \.isUnlimitedFilms),
        .init(title: "Cancela cuando quieras", featureKey: \.isFreeCancellation),
        .init(title: "El primer mes es gratis", featureKey: \.isFreeFirstMonth)
    ]

    init(coordinator: OnboardingCoordinator) {
        self.coordinator = coordinator
    }
    
    func updateSelectedPlan(_ plan: PlanType) {
        selectedPlan = plan
    }
    
    func continueToNextStep() {
        coordinator.push(page: .step3)
    }
    
    func showLogin() {
        coordinator.showLogin()
    }
    
    // MARK: Private
    
    private var coordinator: OnboardingCoordinator
    
    // MARK: Static
    
    static func mock() -> OnboardingStepTwoViewModel {
        OnboardingStepTwoViewModel(coordinator: .init())
    }
}
