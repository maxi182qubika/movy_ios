// Created by Bruno Martinez on 9/3/25.

import SwiftUI

struct OnboardingStepThirdView: View {

    @State private var devices = ["ic_mac", "ic_imac", "ic_ipad", "ic_iphone"]
    @State private var text: String = ""

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
                }
            }
            Text(viewModel.title)
            Text(StringConstants.Onboarding.StepThird.title)
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
