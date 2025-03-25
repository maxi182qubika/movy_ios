// Created by Bruno Martinez on 9/3/25.

import SwiftUI

class LoginViewModel: ObservableObject {
    
      @Published var username: String = "" {
          didSet { validateEmail() }
      }
      @Published var password: String = ""
      @Published var emailError: String?
      @Published var loginError: String?

    private let authManager = AuthManager.shared

    init(coordinator: LoginCoordinator) {
        self.coordinator = coordinator
    }
    
    private func validateEmail() {
        if username.isEmpty {
            emailError = nil
        } else {
            emailError = ValidationUtils.isValidEmail(username) ? nil : "Invalid email"
        }
    }
    
    func login() {
        guard emailError == nil else {
                print("Login failed: Invalid email")
                return
            }
        guard username == "maxi@gmail.com" && password == "1234" else {
             loginError =  "Invalid username or password"
                 return
             }
        
        authManager.login()
        coordinator.push(page: .signUp)
    }
    
    
    func continueToNextStep() {
        coordinator.push(page: .signUp)
    }
    
    func showSignup() {
        coordinator.showSignup()
    }
    
    // MARK: Private
    
    private var coordinator: LoginCoordinator
    
    // MARK: Static
    
    static func mock() -> LoginViewModel {
        LoginViewModel(coordinator: .init())
    }
}
