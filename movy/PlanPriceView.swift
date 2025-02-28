//
//  PlanPriceView.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 25/02/2025.
//

import SwiftUI


struct PlanPriceView: View {
    var selectedPlan: PlanType =  .basic
    let basicPlan = PlanOption(type: .basic)
    let standardPlan = PlanOption(type: .standard)
    let premiumPlan = PlanOption(type: .premium)
    
    var body: some View {
        
        HStack() {
            Text(basicPlan.price)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(selectedPlan == .basic ? Color.blue : Color.gray.opacity(0.5))
            Spacer()
            Divider()
                .frame(height:20)
            Spacer()
            Text(standardPlan.price)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(selectedPlan == .standard ? Color.blue : Color.gray.opacity(0.5))
            
            Spacer()
            Divider()
                .frame(height:20)
            Spacer()
            Text(premiumPlan.price)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(selectedPlan == .premium ? Color.blue : Color.gray.opacity(0.5))
            
        }.padding(.horizontal, 50)
            .font(.system(size: 16))
    }
}

struct PlanFeatureRow: View {
    let title: String
    let featureKey: KeyPath<PlanAttributes, Bool>
    @StateObject  var planOptionBasic: PlanOption
    @StateObject  var planOptionStandard: PlanOption
    @StateObject  var planOptionPremium: PlanOption
    var selectedPlan: PlanType =  .basic
    
    var body: some View {
        VStack {
            Text(title)
                .font(.callout)
                .foregroundColor(.black)
                .padding(.bottom, 24)
            
            HStack {
                let planOptions = [planOptionBasic, planOptionStandard, planOptionPremium]
                
                ForEach(
                    Array(planOptions.enumerated()),
                    id: \.offset
                ) { sectionIndex, section in
                    Spacer()
                    Image(systemName: section.attributes[keyPath: featureKey] ? "checkmark" : "xmark")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(planOptions[sectionIndex].type == selectedPlan ? Color.blue : Color.gray.opacity(0.5))
                    Spacer()
                    
                    if(sectionIndex != planOptions.count-1) {
                        Divider()
                            .frame(height:20)
                    }
                }
            }
            .padding(.horizontal, 24)
            .font(.system(size: 16))
            .frame(maxWidth: .infinity, alignment: .center)
            .background(Color.white)
        }.padding(.top, 16)
    }
    
}

struct PlanPriceView_Previews: PreviewProvider {
    static var previews: some View {
        PlanPriceView()
    }
}

struct PlanFeatureRowPreviews: PreviewProvider {
    static var previews: some View {
        PlanFeatureRow(title: "HD Disponible", featureKey: \.isFreeFirstMonth, planOptionBasic: PlanOption(type: .basic) , planOptionStandard: PlanOption(type: .standard), planOptionPremium: PlanOption(type: .premium), selectedPlan: .basic)
        
    }
}
