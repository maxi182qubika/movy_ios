import Foundation
import SwiftUI

// MARK: - TabsCoordinator

class TabsCoordinator: ObservableObject {
  
  enum Tab: Hashable, CaseIterable {
    case home, search, list, profile
  }
  
  @Published var currentTab: Tab = .home
  
  let homeCoordinator: HomeCoordinator
  
  init() {
    self.homeCoordinator = HomeCoordinator()
  }
    
    func view(for tab: Tab) -> some View {
        switch tab {
        case .home:
            return AnyView(
              HomeNavigationView(coordinator: homeCoordinator)
            )
                .tag(TabsCoordinator.Tab.home)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
        case .search:
            return AnyView(SearchView(viewModel: .init()))
                .tag(TabsCoordinator.Tab.search)
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        case .list:
            return AnyView(SearchView(viewModel: .init()))
                .tag(TabsCoordinator.Tab.list)
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
        case .profile:
            return AnyView(SearchView(viewModel: .init()))
                .tag(TabsCoordinator.Tab.profile)
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
        }
    }
}
