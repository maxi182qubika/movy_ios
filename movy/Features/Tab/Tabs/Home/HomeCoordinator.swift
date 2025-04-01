// Created by Bruno Martinez on 1/4/25.

import SwiftUI

enum HomePage: Hashable {
    case home
    case info
    case movieDetail(id: UUID)
}

class HomeCoordinator: ObservableObject {
  @Published var path: NavigationPath = NavigationPath()
  @Published var sheet: OnboardingSheet?
  @Published var fullScreenCover: OnboardingFullScreenCover?
   
   init(
        path: NavigationPath = .init()
   ) {
       self.path = path
   }
   
   @ViewBuilder
   func build(page: HomePage) -> some View {
       switch page {
       case .home:
           HomeView(viewModel: .init(coordinator: self))
       case .info:
           InfoScreenView(viewModel: .init())
       case .movieDetail(let id):
         MovieDetailView(viewModel: .init(coordinator: self))
       }
   }
  
  func push(page: HomePage) {
      path.append(page)
  }
  
  func pop() {
      path.removeLast()
  }
  
  func popToRoot() {
      path.removeLast(path.count)
  }
  
  func presentSheet(_ sheet: OnboardingSheet) {
      self.sheet = sheet
  }
  
  func presentFullScreenCover(_ cover: OnboardingFullScreenCover) {
      self.fullScreenCover = cover
  }
  
  func dismissSheet() {
      self.sheet = nil
  }
  
  func dismissCover() {
      self.fullScreenCover = nil
  }
  
  @ViewBuilder
  func buildSheet(sheet: OnboardingSheet) -> some View {
      switch sheet {
      case .example: EmptyView()
      }
  }
  
  @ViewBuilder
  func buildCover(cover: OnboardingFullScreenCover) -> some View {
      switch cover {
      case .example: EmptyView()
      }
  }
}
