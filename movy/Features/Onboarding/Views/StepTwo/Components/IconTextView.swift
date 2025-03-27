//
//  IconTextView.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 26/03/2025.
//

import SwiftUI


struct IconTextView: View {
    let text: String
    let image: Image
    
    var body: some View {
        VStack {
            image
                .resizable()
                .scaledToFit()
                .frame(width: 28, height: 28)
                .foregroundColor(.white)
            
            Text(text)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.white)
        }
        .frame(width: 100, height: 120)
        .cornerRadius(10)
    }
}

#Preview {
    IconTextView(text: "My List", image: Image(systemName: "plus"))
}
