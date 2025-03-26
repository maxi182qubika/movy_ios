// Created by Bruno Martinez on 9/3/25.

import SwiftUI

struct CheckmarkText: View {
    let text: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Image(systemName: "checkmark")
                .foregroundColor(Color.customBlueLight)
                .font(.system(size: 18, weight: .bold))
            
            Text(text)
                .font(.system(size: 16))
                .foregroundColor(.black)
        }
    }
}
