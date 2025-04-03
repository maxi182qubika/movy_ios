// Created by Bruno Martinez on 9/3/25.

import SwiftUI

struct OnboardingStepThirdView: View {

   private var devices = ["ic_mac", "ic_imac", "ic_ipad", "ic_iphone"]

    init(viewModel: OnboardingStepThirdViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            OnboardingHeader(action: viewModel.showLogin)
            Spacer()
            
            HStack {
                ForEach(devices.indices, id: \.self) { index in
                    Image(devices[index])
                        .foregroundColor(.primary)
                }
            }
            Text(viewModel.title)
                .foregroundColor(Color.customTextPrimary)
            Text(StringConstants.Onboarding.StepThird.title)
                .foregroundColor(Color.customTextPrimary)
                .bold()
            Text(StringConstants.Onboarding.StepThird.description)
                .padding(.bottom, 60)
            Spacer()
            RoundedButtonComp(
                text: StringConstants.Onboarding.StepThird.btnContinue,
                action: viewModel.continueToNextStep
            )
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
