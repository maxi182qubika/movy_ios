//
//  RoundedButtonComp.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 27/02/2025.
//

import SwiftUI

struct RoundedButtonComp: View {
    var text: String
    var body: some View {
        
        Text(text)
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.customBlueLight)
            .cornerRadius(10)
    }
}
