//
//  BaseTextInputView.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 01/04/2025.
//

import SwiftUI


struct BaseTextInputView: View {
    @Binding var text: String
    let placeholder: String

    var body: some View {
        TextField(placeholder, text: $text)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.gray.opacity(0.6), lineWidth: 1)
            )
    }
}


struct BaseTextInputView_Previews: PreviewProvider {
    static var previews: some View {
        @State var text = ""
        BaseTextInputView(text: $text, placeholder: "Nombre")
    }
}
