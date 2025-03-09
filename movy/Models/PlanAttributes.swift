// Created by Bruno Martinez on 9/3/25.

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
            return PlanAttributes(
                isHD: false,
                isUltraHD: false,
                isMultipleScreen: false,
                isAvailableMobile: false,
                isUnlimitedFilms: false,
                isFreeCancellation: false,
                isFreeFirstMonth: false
            )
        case .standard:
            return PlanAttributes(
                isHD: false,
                isUltraHD: false,
                isMultipleScreen: false,
                isAvailableMobile: true,
                isUnlimitedFilms: true,
                isFreeCancellation: true,
                isFreeFirstMonth: true
            )
        case .premium:
            return PlanAttributes(
                isHD: true,
                isUltraHD: true,
                isMultipleScreen: true,
                isAvailableMobile: true,
                isUnlimitedFilms: true,
                isFreeCancellation: true,
                isFreeFirstMonth: true
            )
        }
    }
}
