import SwiftUI

enum OnboardingPage: Hashable {
    case step1, step2, step3, step4, step5, step6
}

enum OnboardingSheet: String, Identifiable {
    var id: String {
        self.rawValue
    }
    
    case example
}

enum OnboardingFullScreenCover: String, Identifiable {
    var id: String {
        self.rawValue
    }
    
    case example
}

class OnboardingCoordinator: ObservableObject {
    // MARK: Public

    @Published var path: NavigationPath
    @Published var sheet: OnboardingSheet?
    @Published var fullScreenCover: OnboardingFullScreenCover?
    let showLogin: () -> Void

    init(
        path: NavigationPath = .init(),
        sheet: OnboardingSheet? = nil,
        fullScreenCover: OnboardingFullScreenCover? = nil,
        showLogin: @escaping () -> Void = {}
    ) {
        self.path = path
        self.sheet = sheet
        self.fullScreenCover = fullScreenCover
        self.showLogin = showLogin
    }
    
    func push(page: OnboardingPage) {
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
    func build(page: OnboardingPage) -> some View {
        switch page {
        case .step1:
            OnboardingStepOneView(viewModel: .init(coordinator: self))
        case .step2:
            OnboardingStepTwoView(viewModel: .init(coordinator: self))
        case .step3:
            OnboardingStepThirdView(viewModel: .init(coordinator: self))
        case .step4:
            OnboardingStepFourthView(viewModel: .init(coordinator: self))
        case .step5:
            OnboardingStepFifthView(viewModel: .init(coordinator: self))
        case .step6:
            OnboardingStepSixthView(viewModel: .init(coordinator: self))
        }
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
    
    // MARK: Private

}
