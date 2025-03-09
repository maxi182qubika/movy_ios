// Created by Bruno Martinez on 9/3/25.

import SwiftUI

struct LoginView: View {
    // TODO: Similar view to the sign up, let's add some email and password fields, and that's it, maybe some error validations
    
    let onBack: () -> Void

    var body: some View {
        VStack {
            Text("LoginView")
            RoundedButtonComp(text: "Back", action: onBack)
        }
    }
}
