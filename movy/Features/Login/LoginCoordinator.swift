//
//  LoginCoordinator.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 24/03/2025.
//

import SwiftUI

enum LoginPage: Hashable {
    case login, signUp
    
    var name: String {
        switch self {
        case .login: return StringConstants.Onboarding.StepOne.step
        case .signUp: return StringConstants.Onboarding.Signup.step
        }
    }
}

enum LoginSheet: String, Identifiable {
    var id: String {
        self.rawValue
    }
    
    case example
}

enum LoginFullScreenCover: String, Identifiable {
    var id: String {
        self.rawValue
    }
    
    case example
}

class LoginCoordinator: ObservableObject {
    // MARK: Public

    @Published var path: NavigationPath
    @Published var sheet: LoginSheet?
    @Published var fullScreenCover: LoginFullScreenCover?
    let showLogin: () -> Void
    let showSignup: () -> Void
    init(
        path: NavigationPath = .init(),
        sheet: LoginSheet? = nil,
        fullScreenCover: LoginFullScreenCover? = nil,
        showLogin: @escaping () -> Void = {},
        showSignup: @escaping () -> Void = {}
    ) {
        self.path = path
        self.sheet = sheet
        self.fullScreenCover = fullScreenCover
        self.showLogin = showLogin
        self.showSignup = showSignup
    }
    
    func push(page: LoginPage) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func presentSheet(_ sheet: LoginSheet) {
        self.sheet = sheet
    }
    
    func presentFullScreenCover(_ cover: LoginFullScreenCover) {
        self.fullScreenCover = cover
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
    
    func dismissCover() {
        self.fullScreenCover = nil
    }
    
    @ViewBuilder
    func build(page: LoginPage) -> some View {
//        switch page {
//         case .login:
//          LoginView(viewModel: .init(coordinator: self))
//        case .signUp:
//            SignupView(viewModel: .init(coordinator: self))
//        }
    }
    
    @ViewBuilder
    func buildSheet(sheet: LoginSheet) -> some View {
        switch sheet {
        case .example: EmptyView()
        }
    }
    
    @ViewBuilder
    func buildCover(cover: LoginFullScreenCover) -> some View {
        switch cover {
        case .example: EmptyView()
        }
    }
    
    // MARK: Private

}
