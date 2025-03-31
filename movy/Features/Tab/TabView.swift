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
            ForEach(TabsCoordinator.Tab.allCases, id: \.self) { tab in
                coordinator.view(for: tab)
                    .tag(tab)
                    .tabItem {
                        tabLabel(for: tab)
                    }.background(Color.black.edgesIgnoringSafeArea(.all))
            }
        }
    }
    
    @ViewBuilder
    func tabLabel(for tab: TabsCoordinator.Tab) -> some View {
        switch tab {
        case .home:
            Label("Home", systemImage: "house")
        case .search:
            Label("Search", systemImage: "magnifyingglass")
        case .list:
            Label("List", systemImage: "list.bullet")
        case .profile:
            Label("Profile", systemImage: "person.crop.circle")
        }
    }
}
