// Created by Bruno Martinez on 9/3/25.

import SwiftUI


struct MovyTabView: View {
  @ObservedObject var coordinator: TabsCoordinator
  
  init(coordinator: TabsCoordinator) {
    self.coordinator = coordinator
    UITabBar.appearance().backgroundColor = UIColor(Color.customTabBgColor)
    UITabBar.appearance().unselectedItemTintColor = UIColor.white
  }
  
  var body: some View {
      TabView(selection: $coordinator.currentTab) {
            coordinator.view(for: coordinator.currentTab)
      }.tint(Color.blue)
  }
}
