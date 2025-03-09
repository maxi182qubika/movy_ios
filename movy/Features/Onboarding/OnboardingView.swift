// Created by Bruno Martinez on 9/3/25.

import SwiftUI

struct OnboardingView: View {
    
    // MARK: Public
    
    init(coordinator: OnboardingCoordinator) {
        self.coordinator = coordinator
    }

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .step1)
                .navigationDestination(for: OnboardingPage.self) { page in
                    coordinator.build(page: page)
                }
                .sheet(item: $coordinator.sheet) { sheet in
                    coordinator.buildSheet(sheet: sheet)
                }
                .fullScreenCover(item: $coordinator.fullScreenCover) { item in
                    coordinator.buildCover(cover: item)
                }
        }
        .environmentObject(coordinator)
    }
    
    // MARK: Private

    @ObservedObject private var coordinator: OnboardingCoordinator

}
