// Created by Bruno Martinez on 9/3/25.

import SwiftUI

struct OnboardingStepFifthView: View {
    // MARK: Public

    init(viewModel: OnboardingStepFifthViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            OnboardingHeader(action: viewModel.showLogin)
            Spacer()
            Text(viewModel.title)
            RoundedButtonComp(
                text: StringConstants.Onboarding.StepFifth.btnContinue,
                action: viewModel.continueToNextStep
            )
            Spacer()
        }
        .padding(.horizontal)
    }
    
    // MARK: Private
    
    @ObservedObject private var viewModel: OnboardingStepFifthViewModel
    
    // MARK: Static
    
    static func mock() -> Self {
        .init(viewModel: .mock())
    }

}
