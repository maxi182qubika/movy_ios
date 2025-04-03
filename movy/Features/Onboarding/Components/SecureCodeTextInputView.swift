//
//  SecureCodeTextInputView.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 01/04/2025.
//

import SwiftUI

struct SecureCodeTextInputView: View {
    @Binding var text: String
    let placeholder: String
    let onHelpPress: () -> Void
    
    var body: some View {
        HStack {
            TextField(placeholder, text: $text)
                .foregroundColor(.primary)
            
            
            Button(action: onHelpPress) {
                Image(systemName: "questionmark")
                    .font(.system(size: 14, weight: .bold))
                    .frame(width: 24, height: 24)
                    .background(Circle().stroke(Color.gray.opacity(0.6), lineWidth: 1))
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color.gray.opacity(0.6), lineWidth: 1)
        )
    }
}



struct SecureCodeTextInputView_Previews: PreviewProvider {
    static var previews: some View {
        @State var text = ""
        SecureCodeTextInputView(text: $text, placeholder: "Nombre", onHelpPress: {})
    }
}
