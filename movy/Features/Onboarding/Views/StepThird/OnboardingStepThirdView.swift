// Created by Bruno Martinez on 9/3/25.

import SwiftUI

struct OnboardingStepThirdView: View {
    // MARK: Public

    init(viewModel: OnboardingStepThirdViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            OnboardingHeader(action: viewModel.showLogin)
            Spacer()
            Text(viewModel.title)
            RoundedButtonComp(
                text: StringConstants.Onboarding.StepThird.btnContinue,
                action: viewModel.continueToNextStep
            )
            Spacer()
        }
        .padding(.horizontal)
    }
    
    // MARK: Private
    
    @ObservedObject private var viewModel: OnboardingStepThirdViewModel
    
    // MARK: Static
    
    static func mock() -> Self {
        .init(viewModel: .mock())
    }

}

#Preview {
    OnboardingStepThirdView.mock()
}
