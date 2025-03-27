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
                coordinator.tab1.view(for: .first)
                    .tabItem { Label("Home", systemImage: "house") }
                    .tag(TabsCoordinator.Tabs.tab1)
                
                coordinator.tab2.view(for: .second)
                    .tabItem { Label("Search", systemImage: "magnifyingglass") }
                    .tag(TabsCoordinator.Tabs.tab2)
                
                coordinator.tab3.view(for: .third)
                    .tabItem { Label("List", systemImage: "list.bullet") }
                    .tag(TabsCoordinator.Tabs.tab3)
            
                coordinator.tab3.view(for: .fourth)
                    .tabItem { Label("Profile", systemImage: "person.crop.circle") }
                    .tag(TabsCoordinator.Tabs.tab3)
        }.tint(Color.blue)
    }
}
