//
//  PaymentOptionView.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 01/04/2025.
//

import SwiftUI

struct PaymentOptionView: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .foregroundColor(.primary)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
            )
        }
        .buttonStyle(PlainButtonStyle())
     
    }
}

#Preview {
    PaymentOptionView(title: "Tarjeta de crédito o débito") {
        print("Tapped")
    }
}
