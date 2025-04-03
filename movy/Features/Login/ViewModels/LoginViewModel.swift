// Created by Bruno Martinez on 9/3/25.

import SwiftUI

class LoginViewModel: ObservableObject {
    
      @Published var username: String = "" {
          didSet { validateEmail() }
      }
      @Published var password: String = ""
      @Published var emailError: String?
      @Published var loginError: String?
      @Published var isPasswordVisible: Bool = false


    private let authManager = AuthManager.shared
    let onBack: () -> Void

    init(onBack: @escaping () -> Void) {
        self.onBack = onBack
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
        guard username == "" && password == "" else {
             loginError =  "Invalid username or password"
                 return
             }
        
        authManager.login()
    }
    
    // MARK: Static
    
    static func mock() -> LoginViewModel {
      LoginViewModel {}
    }
}
