//
//  SignupView.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 24/03/2025.
//


import SwiftUI

struct SignupView: View {
    // MARK: Public

    init(viewModel: SignupViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
           // OnboardingHeader(action: viewModel.showSignup())
            Spacer()
           
            RoundedButtonComp(
                text: StringConstants.Onboarding.StepSixth.btnContinue,
                action: { viewModel.showSignup() }
            )
            Spacer()
        }
        .padding(.horizontal)
    }
    
    // MARK: Private
    
    @ObservedObject private var viewModel: SignupViewModel
    
    // MARK: Static
    
    static func mock() -> Self {
        .init(viewModel: .mock())
    }

}

