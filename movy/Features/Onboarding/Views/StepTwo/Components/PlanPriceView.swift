//
//  PlanPriceView.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 25/02/2025.
//

import SwiftUI


struct PlanPriceView: View {
    // MARK: Public

    init(selectedPlan: Binding<PlanType>) {
        self._selectedPlan = selectedPlan
    }
    
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

    // MARK: Private

    @Binding private var selectedPlan: PlanType
    private let basicPlan = PlanOption(type: .basic)
    private let standardPlan = PlanOption(type: .standard)
    private let premiumPlan = PlanOption(type: .premium)
}

struct PlanFeatureRow: View {
    let title: String
    let featureKey: KeyPath<PlanAttributes, Bool>
    let plans: [PlanOption] = [
        .init(type: .basic),
        .init(type: .standard),
        .init(type: .premium)
    ]
    @Binding var selectedPlan: PlanType
    
    var body: some View {
        VStack {
            Text(title)
                .font(.callout)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding([.horizontal, .bottom], 24)
            
            HStack {
                ForEach(
                    Array(plans.enumerated()),
                    id: \.offset
                ) { sectionIndex, section in
                    Spacer()
                    Image(systemName: section.attributes[keyPath: featureKey] ? "checkmark" : "xmark")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(
                            plans[sectionIndex].type == selectedPlan ? .blue : .gray.opacity(0.5)
                        )
                    Spacer()
                    if(sectionIndex != plans.count-1) {
                        Divider()
                            .frame(height: 20)
                    }
                }
            }
            .padding(.horizontal, 24)
            .font(.system(size: 16))
            .frame(maxWidth: .infinity, alignment: .center)
            .background(Color.white)
        }
        .padding(.top, 16)
    }
    
}

struct PlanPriceView_Previews: PreviewProvider {
    static var previews: some View {
        PlanPriceView(selectedPlan: .constant(.basic))
    }
}

struct PlanFeatureRowPreviews: PreviewProvider {
    static var previews: some View {
        PlanFeatureRow(
            title: "HD Disponible",
            featureKey: \.isFreeFirstMonth,
            selectedPlan: .constant(.basic)
        )
    }
}
