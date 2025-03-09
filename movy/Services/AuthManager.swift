// Created by Bruno Martinez on 9/3/25.

import SwiftUI

// TODO: Refactor this later, we could use dependency injection etc this is just for testing purposes
class AuthManager: ObservableObject {
    @Published var isAuthenticated: Bool = false
    
    static let shared = AuthManager()
    
    // Simulación de autenticación para testing
    func login() {
        isAuthenticated = true
    }
    
    func logout() {
        isAuthenticated = false
    }
}
