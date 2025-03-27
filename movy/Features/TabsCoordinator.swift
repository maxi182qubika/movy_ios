//
//  TabsCoordinator.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 26/03/2025.
//

import Foundation
import SwiftUI

// MARK: - TabsCoordinator
class TabsCoordinator: ObservableObject {
    
    enum Tabs: Hashable {
        case tab1
        case tab2
        case tab3
        case tab4
    }
    
    @Published var currentTab: Tabs = .tab1
    
    let tab1 = CommonCoordinator()
    let tab2 = CommonCoordinator()
    let tab3 = CommonCoordinator()
    let tab4 = CommonCoordinator()
    
    func destination() -> some View {
        MovyTabView(coordinator: self)
    }
}

class CommonCoordinator: ObservableObject {
    
    enum Screen: Hashable {
        case first
        case second
        case third
        case fourth
    }
    
    func view(for screen: Screen) -> some View {
        switch screen {
        case .first: return AnyView(HomeScreenView(viewModel: HomeViewModel(coordinator: TabsCoordinator())))
        case .second: return AnyView(SearchScreenView(viewModel: SearchViewModel(coordinator: TabsCoordinator())))
        case .third: return AnyView(ListScreenView(viewModel: ListScreenViewModel(coordinator: TabsCoordinator())))
        case .fourth: return AnyView(ProfileScreenView(viewModel: ProfileViewModel(coordinator: TabsCoordinator())))

        }
    }
}
