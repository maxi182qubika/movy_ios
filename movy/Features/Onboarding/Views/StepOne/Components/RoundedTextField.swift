//
//  RoundedTextField.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 23/03/2025.
//

import SwiftUI

struct RoundedTextField: View {
    var placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    @State private var isPasswordVisible: Bool = false

    var body: some View {
        HStack {
             if isSecure && !isPasswordVisible {
                 SecureField(placeholder, text: $text)
             } else {
                 TextField(placeholder, text: $text)
             }
             
             if isSecure {
                 Button(action: { isPasswordVisible.toggle() }) {
                     Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                         .foregroundColor(.gray)
                 }
             }
         }
         .padding(12)
         .background(RoundedRectangle(cornerRadius: 4).stroke(Color.gray, lineWidth: 1))
         .padding(.horizontal, 16)
     }
  
}

struct RoundedTextField_Previews: PreviewProvider {
    static var previews: some View {
        @State var text = ""
        RoundedTextField(placeholder: "Enter username", text: $text)
            .padding()
    }
}
