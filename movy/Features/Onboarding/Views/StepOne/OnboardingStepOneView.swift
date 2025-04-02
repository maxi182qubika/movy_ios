//
//  LoginStepper_1.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 21/02/2025.
//

import SwiftUI


struct OnboardingStepOneView: View {
    // MARK: Public

    init(viewModel: OnboardingStepOneViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            OnboardingHeader(action: viewModel.showLogin)
            Color.clear.frame(height: 20)
            checkmarkIcon
            
            VStack(alignment: .leading, spacing: 5) {
                title
                subtitle
            }
            benefits
            Spacer()
            RoundedButtonComp(
                text: StringConstants.Onboarding.StepOne.viewPlans,
                action: viewModel.continueToNextStep
            )
            .padding(.bottom, 20)
        }
        .padding(.top, 40)
        .padding(.horizontal, 24)
    }
    
    // MARK: Private
    
    @ObservedObject private var viewModel: OnboardingStepOneViewModel
    
    // Note: Maxi this could be a image, but good implementation though
    private var checkmarkIcon: some View {
        HStack {
            Circle()
                .stroke(Color.customBlueLight, lineWidth: 2)
                .frame(width: 40, height: 40)
                .overlay(
                    Image(systemName: "checkmark")
                        .foregroundColor(Color.customBlueLight)
                        .font(.system(size: 20, weight: .bold))
                )
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var title: some View {
        Text(StringConstants.Onboarding.StepOne.step)
            .font(.system(size: 14, weight: .bold))
            .foregroundColor(Color.customTextPrimary)
    }
    
    private var subtitle: some View {
        Text(StringConstants.Onboarding.StepOne.selectPlan)
            .font(.system(size: 22, weight: .bold))
            .foregroundColor(Color.customTextPrimary)
    }
    
    private var benefits: some View {
        VStack(alignment: .leading, spacing: 24) {
            CheckmarkText(text: StringConstants.Onboarding.StepOne.checkMark_1)
            CheckmarkText(text: StringConstants.Onboarding.StepOne.checkMark_2)
            CheckmarkText(text: StringConstants.Onboarding.StepOne.checkMark_3)
        }
        .padding(.top)
    }
    
    static func mock() -> Self {
        .init(viewModel: .mock())
    }

}

#Preview {
    OnboardingStepOneView.mock()
}
