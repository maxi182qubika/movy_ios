//
//  PlanOptions.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 25/02/2025.
//

import Foundation


enum PlanType: String, Codable {
    case basic, standard, premium
    var displayName: String {
        switch self {
        case .basic:
            return "Basic"
        case .standard:
            return "Standard"
        case .premium:
            return "Premium"
        }
    }
    var planPrice: Float {
        switch self {
        case .basic:
            return 8.99
        case .standard:
            return 12.99
        case .premium:
            return 15.99
        }
    }
    
}

class PlanOption: ObservableObject {
    @Published var type: PlanType {
        didSet {
            attributes = PlanAttributes.forPlanType(type)
        }
    }
    
    @Published var attributes: PlanAttributes
    var name: String {
        return type.displayName
    }
    
    var price: String {
        return String(format: "$%.2f", type.planPrice)
    }
    
    init(type: PlanType) {
        self.type = type
        self.attributes = PlanAttributes.forPlanType(type)
    }
    
    static func == (lhs: PlanOption, rhs: PlanOption) -> Bool {
            return lhs.type == rhs.type
        }
}

struct PlanAttributes: Codable {
    var isHD: Bool
    var isUltraHD: Bool
    var isMultipleScreen: Bool
    var isAvailableMobile: Bool
    var isUnlimitedFilms: Bool
    var isFreeCancellation: Bool
    var isFreeFirstMonth: Bool

    static func forPlanType(_ type: PlanType) -> PlanAttributes {
        switch type {
        case .basic:
            return PlanAttributes(isHD: false, isUltraHD: false, isMultipleScreen:false, isAvailableMobile: false, isUnlimitedFilms: false, isFreeCancellation: false, isFreeFirstMonth: false)
        case .standard:
            return PlanAttributes(isHD: false, isUltraHD: false, isMultipleScreen:false, isAvailableMobile: true, isUnlimitedFilms: true, isFreeCancellation: true, isFreeFirstMonth: true)
        case .premium:
            return PlanAttributes(isHD: true, isUltraHD: true, isMultipleScreen:true, isAvailableMobile: true, isUnlimitedFilms: true, isFreeCancellation: true, isFreeFirstMonth: true)
        }
    }
}
