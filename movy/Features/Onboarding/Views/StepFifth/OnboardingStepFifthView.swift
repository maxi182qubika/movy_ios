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
            stepHeader
            PaymentOptionView(title: "Tarjeta de crédito o débito", action: viewModel.continueToNextStep)
            Spacer()
        }
        .padding(.horizontal)
    }
    
    private var stepHeader: some View {
        VStack(alignment: .leading, spacing: 5) {
            Image("card")
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: 58, height: 38)
                .foregroundColor(Color.customBlueLight)
                .padding(.top, 20)
           
            Text(viewModel.title)
                .font(.system(size: 14, weight: .medium))
            
            Text("Configura tu forma de pago.")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.primary)
            
            Text("Cancela antes del 28/02/19\ny no se te cobrará ningún\ncargo.")
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(.primary)
                .padding(.top, 20)
            
            Text("Como recordatorio, te\nenviaremos un email 3 días\nantes.")
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(.primary)
                .padding(.top, 20)
            
            Text("Sin compromisos.\nCancela online cuando\nquieras.")
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(.primary)
                .padding(.vertical, 20)
        
        }
        .padding(.top, 60)
    }
    
    // MARK: Private
    
    @ObservedObject private var viewModel: OnboardingStepFifthViewModel
    
    // MARK: Static
    
    static func mock() -> Self {
        .init(viewModel: .mock())
    }

}
