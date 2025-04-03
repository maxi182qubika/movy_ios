// Created by Bruno Martinez on 1/4/25.

import SwiftUI

struct HomeNavigationView: View {
  
  // MARK: Public
  
  init(coordinator: HomeCoordinator) {
    self.coordinator = coordinator
  }
  
  var body: some View {
    NavigationStack(path: $coordinator.path) {
      coordinator.build(page: .home)
        .navigationDestination(for: HomePage.self) { page in
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
  
  @ObservedObject private var coordinator: HomeCoordinator
  
}
