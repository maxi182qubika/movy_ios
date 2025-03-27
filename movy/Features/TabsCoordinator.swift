import Foundation
import SwiftUI

// MARK: - TabsCoordinator

class TabsCoordinator: ObservableObject {
  
  enum Tab: Hashable {
    case home, search, list, profile
  }
  
  @Published var currentTab: Tab = .home
  
  let homeCoordinator: CommonCoordinator // Replace with HomeCoordinator
  let searchCoordinator: CommonCoordinator // Replace with SearchCoordinator
  let listCoordinator: CommonCoordinator // Replace with ListCoordinator
  let profileCoordinator: CommonCoordinator // Replace with ProfileCoordinator
  
  init() {
    self.homeCoordinator = CommonCoordinator(screenType: .home)
    self.searchCoordinator = CommonCoordinator(screenType: .search)
    self.listCoordinator = CommonCoordinator(screenType: .list)
    self.profileCoordinator = CommonCoordinator(screenType: .profile)
  }
}

// MARK: - CommonCoordinator


// Este concepto esta mal, porque usariamos un coordinator "comun" a todos?
// Cada vista deberia tener su propio coordinator si y solo si es necesario, meaning si tiene navegacion
// - Si no tiene navegacion, no es necesario un coordinator
// - Si tiene navegacion, el coordinator deberia ser unico para esa vista
// Ademas de esto, si bien se llama "CommonCoordinator", esto de abajo no es un coordinator, es un switch case basado en screen type que devuelve una vista, no maneja nada de navegacion


class CommonCoordinator: ObservableObject {
  
  enum ScreenType {
    case home, search, list, profile
  }
  
  private let screenType: ScreenType
  
  init(screenType: ScreenType) {
    self.screenType = screenType
  }
  
  func build() -> some View {
    switch screenType {
    case .home:
      return AnyView(
        HomeScreenView(
          viewModel: HomeViewModel()
        )
      )
    case .search:
      return AnyView(
        SearchScreenView(
          viewModel: SearchViewModel()
        )
      )
    case .list:
      return AnyView(
        ListScreenView(
          viewModel: ListScreenViewModel()
        )
      )
    case .profile:
      return AnyView(
        ProfileScreenView(
          viewModel: ProfileViewModel()
        )
      )
    }
  }
}
