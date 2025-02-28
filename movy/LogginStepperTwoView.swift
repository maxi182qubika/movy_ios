//
//  LogginStepperTwoView.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 21/02/2025.
//

import SwiftUI


struct LoginStepTwoView: View {
    
    @State var selectedPlan: PlanType =  .basic
    var body: some View {
        
        ScrollView {
            VStack() {
                VStack(alignment: .leading, spacing: 5) {
                    Text("PASO 2 DE 3")
                        .font(.system(size: 14, weight: .bold))
                    
                    Text("Selecciona el plan ideal para ti")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.black)
                    
                    Text("Cambia a un plan inferior  o superior en cualquier momento")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(.black)
                        .padding(.top, 20)
                    
                }.padding([.leading], 20)
                    .padding(.top, 60)
                
                HStack(spacing: 16) {
                    Spacer()
                    PlanComponentView(text: "Basico", isSelected: selectedPlan == .basic)
                        .onTapGesture {
                            print(selectedPlan)
                            selectedPlan =  .basic
                        }
                    
                    PlanComponentView(text: "Estandar", isSelected:  selectedPlan == .standard)
                        .onTapGesture {
                            print(selectedPlan)
                            selectedPlan =  .standard
                        }
                    
                    PlanComponentView(text: "Premium", isSelected:  selectedPlan == .premium)
                        .onTapGesture {
                            print(selectedPlan)
                            selectedPlan =  .premium
                        }
                    Spacer()
                }.padding(.top, 60)
                
                Text("Precio mensual cuando se termine el mes gratis.")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(.black)
                    .frame(maxWidth: 230, alignment: .center)
                    .multilineTextAlignment(.center)
                
                
                VStack {
                    
                    PlanPriceView(selectedPlan: selectedPlan)
                    
                    PlanFeatureRow(title: "HD Disponible", featureKey: \.isHD, planOptionBasic: PlanOption(type: .basic) , planOptionStandard: PlanOption(type: .standard), planOptionPremium: PlanOption(type: .premium), selectedPlan: selectedPlan)
                    
                    PlanFeatureRow(title: "Ultra HD Disponible", featureKey: \.isUltraHD, planOptionBasic: PlanOption(type: .basic) , planOptionStandard: PlanOption(type: .standard), planOptionPremium: PlanOption(type: .premium), selectedPlan: selectedPlan)
                    
                    PlanFeatureRow(title: "Pantallas en las que puedes ver al mismo tiempo", featureKey: \.isMultipleScreen, planOptionBasic: PlanOption(type: .basic) , planOptionStandard: PlanOption(type: .standard), planOptionPremium: PlanOption(type: .premium), selectedPlan: selectedPlan)
                    
                    PlanFeatureRow(title: "Ve en tu laptop, TV, telefono y tablet", featureKey: \.isAvailableMobile, planOptionBasic: PlanOption(type: .basic) , planOptionStandard: PlanOption(type: .standard), planOptionPremium: PlanOption(type: .premium), selectedPlan: selectedPlan)
                    
                    PlanFeatureRow(title: "Películas y programas de TV ilimitados", featureKey: \.isUnlimitedFilms, planOptionBasic: PlanOption(type: .basic) , planOptionStandard: PlanOption(type: .standard), planOptionPremium: PlanOption(type: .premium), selectedPlan: selectedPlan)
                    
                    PlanFeatureRow(title: "Cancela cuando quieras", featureKey: \.isFreeCancellation, planOptionBasic: PlanOption(type: .basic) , planOptionStandard: PlanOption(type: .standard), planOptionPremium: PlanOption(type: .premium), selectedPlan: selectedPlan)
                    
                    PlanFeatureRow(title: "El primer mes es gratis", featureKey: \.isFreeFirstMonth, planOptionBasic: PlanOption(type: .basic) , planOptionStandard: PlanOption(type: .standard), planOptionPremium: PlanOption(type: .premium), selectedPlan: selectedPlan)
                    
                    TermsTextView()
                        .padding(.horizontal, 24)
                        .padding(.top, 12)
                    
                    NavigationLink(destination: LoginStepTwoView()) {
                        RoundedButtonComp(text: StringConstants.LogginStepperTwo.btnContinue)
                    }.padding(.top, 32)
                        .padding(.horizontal)
                    
                }
                .padding(.top, 30)
                
            }.frame(maxHeight: .infinity, alignment: .top)
            
        }
    }
}

struct LoginStepTwoView_Previews: PreviewProvider {
    static var previews: some View {
        LoginStepTwoView()
    }
}
