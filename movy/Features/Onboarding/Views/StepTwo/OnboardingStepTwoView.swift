//
//  LogginStepperTwoView.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 21/02/2025.
//

import SwiftUI


struct OnboardingStepTwoView: View {
    
    // MARK: Public
    
    init(viewModel: OnboardingStepTwoViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(spacing: 20) {
            OnboardingHeader(action: viewModel.showLogin)
            ScrollView {
                VStack() {
                    stepHeader
                    planTypeHStack
                    monthlyPlanLabel
                    VStack {
                        PlanPriceView(selectedPlan: $viewModel.selectedPlan)
                        ForEach(viewModel.planFeatures) { feature in
                            PlanFeatureRow(
                                title: feature.title,
                                featureKey: feature.featureKey,
                                selectedPlan: $viewModel.selectedPlan
                            )
                        }
                        terms
                        continueButton
                    }
                    .padding(.top, 30)
                }
                .frame(maxHeight: .infinity, alignment: .top)
            }
        }
        .padding(.horizontal, 24)
    }
    
    // MARK: Private
    
    @ObservedObject private var viewModel: OnboardingStepTwoViewModel
    
    private var stepHeader: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("PASO 2 DE 3")
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(Color.customTextPrimary)
            
            Text("Selecciona el plan ideal para ti")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Color.customTextPrimary)
            
            Text("Cambia a un plan inferior  o superior en cualquier momento")
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(Color.customTextPrimary)
                .padding(.top, 20)
            
        }
        .padding(.top, 60)
    }
    
    private var monthlyPlanLabel: some View {
        Text("Precio mensual cuando se termine el mes gratis.")
            .font(.system(size: 16, weight: .regular))
            .foregroundColor(Color.customTextPrimary)
            .frame(maxWidth: 230, alignment: .center)
            .multilineTextAlignment(.center)
    }
    
    private var planTypeHStack: some View {
        HStack(spacing: 16) {
            Spacer()
            // Remember we can use this! CaseIterable, so we don't
            // Have duplicated code everywhere :)
            ForEach(PlanType.allCases, id: \.displayName) { plan in
                PlanComponentView(
                    text: plan.displayName,
                    isSelected: viewModel.selectedPlan == plan
                )
                .onTapGesture {
                    viewModel.updateSelectedPlan(plan)
                }
            }
            Spacer()
        }
        .padding(.top, 60)
    }
    
    private var terms: some View {
        TermsTextView()
            .padding(.horizontal, 24)
            .padding(.top, 12)
    }
    
    private var continueButton: some View {
        RoundedButtonComp(
            text: StringConstants.Onboarding.StepTwo.btnContinue,
            action: viewModel.continueToNextStep
        )
            .padding(.top, 32)
            .padding(.horizontal)
    }

    // MARK: Static
    
    static func mock() -> Self {
        .init(viewModel: .mock())
    }
}

#Preview {
    OnboardingStepTwoView.mock()
}
