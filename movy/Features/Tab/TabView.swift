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
      coordinator.homeCoordinator.build()
        .tag(TabsCoordinator.Tab.home)
        .tabItem {
          Label("Home", systemImage: "house")
        }
      
      coordinator.searchCoordinator.build()
        .tag(TabsCoordinator.Tab.search)
        .tabItem {
          Label("Search", systemImage: "magnifyingglass")
        }
      
      coordinator.listCoordinator.build()
        .tag(TabsCoordinator.Tab.list)
        .tabItem {
          Label("List", systemImage: "list.bullet")
        }
      
      coordinator.profileCoordinator.build()
        .tag(TabsCoordinator.Tab.profile)
        .tabItem {
          Label("Profile", systemImage: "person.crop.circle")
        }
    }.tint(Color.blue)
  }
}
