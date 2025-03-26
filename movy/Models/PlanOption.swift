//
//  PlanOptions.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 25/02/2025.
//

import Foundation

struct PlanOption {
    let type: PlanType
    
    var attributes: PlanAttributes {
        PlanAttributes.forPlanType(type)
    }

    var name: String {
        type.displayName
    }
    
    var price: String {
        return String(format: "$%.2f", type.planPrice)
    }
    
    init(type: PlanType) {
        self.type = type
    }
    
    static func == (lhs: PlanOption, rhs: PlanOption) -> Bool {
        return lhs.type == rhs.type
    }
}
