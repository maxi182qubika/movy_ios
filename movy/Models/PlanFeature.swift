// Created by Bruno Martinez on 9/3/25.

import SwiftUI

struct PlanFeature: Identifiable {
    let id = UUID()
    let title: String
    let featureKey: KeyPath<PlanAttributes, Bool>
}
