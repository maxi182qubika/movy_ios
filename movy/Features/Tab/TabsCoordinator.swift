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
            return AnyView(homeCoordinator.build(page: .home))
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

class HomeCoordinator: ObservableObject {
    @Published var currentPage: HomePage = .home

    @Published var path: NavigationPath = NavigationPath()
 
    enum HomePage {
        case home
        case info
    }
    
    init(
         path: NavigationPath = .init()
    ) {
        self.path = path
    }
    
    @ViewBuilder
    func build(page: HomePage) -> some View {
            switch currentPage {
            case .home:
                HomeView(viewModel: .init(coordinator: self))
            case .info:
                InfoScreenView(viewModel: .init())
            }
    
    }
    
    func switchTo(page: HomePage) {
           currentPage = page
       }
    
    func push(page: HomePage) {
        path.append(page)
    }
 
}


// MARK: - CommonCoordinator

