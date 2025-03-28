import Foundation
import SwiftUI

// MARK: - TabsCoordinator

class TabsCoordinator: ObservableObject {
  
  enum Tab: Hashable {
    case home, search, list, profile
  }
  
  @Published var currentTab: Tab = .home
  
  let homeCoordinator: HomeCoordinator
  let searchCoordinator: HomeCoordinator // Replace with SearchCoordinator
  let listCoordinator: HomeCoordinator // Replace with ListCoordinator
  let profileCoordinator: HomeCoordinator // Replace with ProfileCoordinator
  
  init() {
    self.homeCoordinator = HomeCoordinator(screenType: .home)
    self.searchCoordinator = HomeCoordinator(screenType: .search)
    self.listCoordinator = HomeCoordinator(screenType: .list)
    self.profileCoordinator = HomeCoordinator(screenType: .profile)
  }
    
    
      func view(for tab: Tab) -> some View {
          switch tab {
          case .home:
              return AnyView(homeCoordinator.build(page: .home))
          case .search:
              return AnyView(SearchScreenView(viewModel: .init()))
          case .list:
              return AnyView(SearchScreenView(viewModel: .init()))
          case .profile:
              return AnyView(SearchScreenView(viewModel: .init()))
          }
      }
}

class HomeCoordinator: ObservableObject {
    
    @Published var path: NavigationPath
 
    enum HomePage {
        case home
        case info
    }
    
    let screenType: TabsCoordinator.Tab
    
    init(screenType: TabsCoordinator.Tab,
         path: NavigationPath = .init()
    ) {
        self.screenType = screenType
        self.path = path
    }
    
    @ViewBuilder
    func build(page: HomePage) -> some View {
        switch page {
        case .home:
            HomeScreenView(viewModel: .init(coordinator: HomeCoordinator(screenType: .home)))
        case .info:
            InfoScreenView(viewModel: .init())
        }
    }
    
    func push(page: HomePage) {
        path.append(page)
    }
}



// MARK: - CommonCoordinator


// Este concepto esta mal, porque usariamos un coordinator "comun" a todos?
// Cada vista deberia tener su propio coordinator si y solo si es necesario, meaning si tiene navegacion
// - Si no tiene navegacion, no es necesario un coordinator
// - Si tiene navegacion, el coordinator deberia ser unico para esa vista
// Ademas de esto, si bien se llama "CommonCoordinator", esto de abajo no es un coordinator, es un switch case basado en screen type que devuelve una vista, no maneja nada de navegacion

