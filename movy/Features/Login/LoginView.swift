// Created by Bruno Martinez on 9/3/25.

import SwiftUI

struct LoginView: View {
    // TODO: Similar view to the sign up, let's add some email and password fields, and that's it, maybe some error validations

    let onBack: () -> Void
    
    init(viewModel: LoginViewModel, onBack: @escaping () -> Void) {
            self.viewModel = viewModel
            self.onBack = onBack
        }

    var body: some View {
        VStack(alignment: .leading) {
            
            Text(StringConstants.App.appName)
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(Color.customBlueLight)
            Text("Login")
                .frame(maxWidth: .infinity, alignment: .center)
            
            RoundedTextField(placeholder: "Email", text: $viewModel.username)
                .textInputAutocapitalization(.never)

            if let emailError = viewModel.emailError {
                            Text(emailError)
                                .foregroundColor(.red)
                                .font(.caption)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 24)
                        }
            
            RoundedTextField(placeholder: "Contraseña", text: $viewModel.password, isSecure: true)
                   .autocapitalization(.none)
                   .textContentType(.password)
                   .keyboardType(.default)

 
            Button(action: {
                viewModel.showSignup()
            }) {
                Text("Create Account")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(Color.customBlueLight)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            
            Spacer()
            if let loginError = viewModel.loginError {
                            Text(loginError)
                                .foregroundColor(.red)
                                .font(.caption)
                                .frame(maxWidth: .infinity, alignment: .center)
                               
                        }
            
            RoundedButtonComp(text: "Login", action: { viewModel.login() })

            RoundedButtonComp(text: "Back", action: onBack)
            
         
        }.padding(.horizontal)
    }
    
    @ObservedObject private var viewModel: LoginViewModel
    
    static func mock() -> Self {
          .init(viewModel: .mock(), onBack: {})
      }
}

#Preview {
    LoginView.mock()
}
