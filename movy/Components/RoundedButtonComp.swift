//
//  RoundedButtonComp.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 27/02/2025.
//

import SwiftUI

struct RoundedButtonComp: View {
    let text: String
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.customBlueLight)
                .cornerRadius(10)
        }
    }
}
