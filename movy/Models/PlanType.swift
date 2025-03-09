// Created by Bruno Martinez on 9/3/25.

enum PlanType: String, Codable, CaseIterable {
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
