// Created by Bruno Martinez on 9/3/25.

import SwiftUI

struct OnboardingStepSixthView: View {
    // MARK: Public
    
    init(viewModel: OnboardingStepSixthViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                OnboardingHeader(action: viewModel.showLogin)
                stepHeader
                cardDetailsInputView
                bottomDescription
                    .padding(.top, 16)
                
                Spacer()
                RoundedButtonComp(text: "INICIAR MEMBRESIA", action: viewModel.finishOnboarding)
                
            }
            .padding(.horizontal)
        }
    }
    
    private var stepHeader: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(viewModel.title)
                .font(.system(size: 14, weight: .medium))
            
            Text("Configura tu tarjeta de\ncrédito o débito.")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.primary)
            
            HStack() {
                ForEach(0..<3, id: \.self) { _ in
                    Image("card")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 38, height: 25)
                        .foregroundColor(Color.customBlueLight)
                        .padding(.top, 20)
                }
            }
        }
        .padding(.top, 60)
    }
    
    private var cardDetailsInputView: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            BaseTextInputView(text: $viewModel.cardHolderName, placeholder: "Nombre")
                .padding(.top, 16)
            BaseTextInputView(text: $viewModel.cardHolderLastName, placeholder: "Apellido")
                .padding(.top, 16)
            BaseTextInputView(text: $viewModel.cardNumber, placeholder: "Número de tarjeta")
                .padding(.top, 16)
            BaseTextInputView(text: $viewModel.emptyText, placeholder: "")
                .padding(.top, 16)
            SecureCodeTextInputView(text: $viewModel.cvv, placeholder: "Código de seguridad (CVV)", onHelpPress: {})
                .keyboardType(.numberPad)
            
            Text(viewModel.cvvError ?? " ")
                .foregroundColor(.red)
                .font(.caption)
                .frame(maxWidth: .infinity, alignment: .leading)
                .keyboardType(.numberPad)
                .padding(.horizontal, 16)
        }
        
    }
    
    private var bottomDescription: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("TU PLAN")
                .font(.system(size: 14, weight: .medium))
            
            HStack {
                Text("Streaming ilimitado en\nSD por US$ 8,99 al mes\ndespués de la prueba\ngratis.")                            .font(.system(size: 14, weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                Text("Cambiar")
                    .font(.system(size: 14, weight: .heavy))
                    .frame(alignment: .trailing)
                    .onTapGesture {
                        viewModel.backToSelectPlanStep()
                    }
            }
            
            VStack(alignment: .leading) {
                Text("Los pagos se procesarán internacionalmente.\nEs posible que se apliquen comisiones bancarias adicionales.")
                Text("Al hacer clic en el botón, aceptas nuestros Términos de uso y nuestra Declaración de privacidad, y declaras que tienes más de 18 años.")
            }
            .padding(.top, 8)
            .font(.footnote)
            .foregroundColor(.primary)
        }
    }
    
    // MARK: Private
    
    @ObservedObject private var viewModel: OnboardingStepSixthViewModel
    
    // MARK: Static
    
    static func mock() -> Self {
        .init(viewModel: .mock())
    }
    
}
