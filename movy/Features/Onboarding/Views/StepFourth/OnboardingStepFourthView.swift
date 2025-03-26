// Created by Bruno Martinez on 9/3/25.

import SwiftUI

struct OnboardingStepFourthView: View {
    // MARK: Public

    init(viewModel: OnboardingStepFourthViewModel) {
        self.viewModel = viewModel
    }
    
    private var stepHeader: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(viewModel.title)
                .font(.system(size: 14, weight: .medium))
            
            Text("Suscríbite para que comiences tu mes gratis")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.black)
            
            Text("¡Dos pasos más y listo!")
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(.black)
                .padding(.top, 20)
            
            Text("Crea tu cuenta.")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.black)
            
        }
        .padding(.top, 60)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            OnboardingHeader(action: viewModel.showLogin)
            stepHeader
             
            VStack(alignment: .leading) {
                RoundedTextField(placeholder: "Email", text: $viewModel.username)
                    .textInputAutocapitalization(.never)
                
                if let emailError = viewModel.emailError {
                    Text(emailError)
                        .foregroundColor(.red)
                        .font(.caption)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 24)
                }
                
                RoundedTextField(placeholder: "Contraseña", text: $viewModel.password, isSecure: true)
                    .autocapitalization(.none)
                    .textContentType(.password)
                    .keyboardType(.default)
                
            }
            
            RoundedButtonComp(
                text: StringConstants.Onboarding.StepFourth.btnContinue,
                action: viewModel.continueToNextStep
            )
            Spacer()
        }
        .padding(.horizontal)
    }
    
    // MARK: Private
    
    @ObservedObject private var viewModel: OnboardingStepFourthViewModel
    
    // MARK: Static
    
    static func mock() -> Self {
        .init(viewModel: .mock())
    }

}
