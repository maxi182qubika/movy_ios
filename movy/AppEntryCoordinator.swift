import SwiftUI

enum EntryPage: Hashable {
    case login, onboarding
}

enum EntrySheet: String, Identifiable {
    var id: String { self.rawValue }
    case example
}

enum EntryFullScreenCover: String, Identifiable {
    var id: String { self.rawValue }
    case example
}

class AppEntryCoordinator: ObservableObject {
    @Published var currentPage: EntryPage = .onboarding
    @Published var sheet: EntrySheet?
    @Published var fullScreenCover: EntryFullScreenCover?
    
    func replaceWith(page: EntryPage) {
        currentPage = page
    }
    
    func presentSheet(_ sheet: EntrySheet) {
        self.sheet = sheet
    }
    
    func presentFullScreenCover(_ cover: EntryFullScreenCover) {
        self.fullScreenCover = cover
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
    
    func dismissCover() {
        self.fullScreenCover = nil
    }
    
    @ViewBuilder
    func build() -> some View {
        if AuthManager.shared.isAuthenticated {
            MovyTabView()
        } else {
            switch currentPage {
            case .login:
                LoginView(
                    viewModel: LoginViewModel(coordinator: LoginCoordinator.init()), // usar logincordinator
                    onBack: { [weak self] in
                        self?.replaceWith(page: .onboarding)
                    }
                )
            case .onboarding:
                OnboardingView(
                    coordinator: .init(
                        showLogin: { [weak self] in
                            self?.replaceWith(page: .login)
                        }
                    )
                )
            }
        }
    }
    
    @ViewBuilder
    func buildSheet(sheet: EntrySheet) -> some View {
        switch sheet {
        case .example: EmptyView()
        }
    }
    
    @ViewBuilder
    func buildCover(cover: EntryFullScreenCover) -> some View {
        switch cover {
        case .example: EmptyView()
        }
    }
}
