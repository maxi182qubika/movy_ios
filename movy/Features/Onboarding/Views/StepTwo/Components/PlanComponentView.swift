//
//  PlanComponentView.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 21/02/2025.
//

import SwiftUI

struct PlanComponentView: View {
    var text: String
    var isSelected: Bool

    var body: some View {
        
    let shapeScale: CGFloat = 50.0

        VStack(spacing: 0) {
            ZStack {
                Rectangle()
                    .fill(isSelected ? Color.customBlueLight : Color.customBlueLight.opacity(0.5))
                    .frame(width: 100, height: 100)
                    .cornerRadius(4)
                    .shadow(radius: 10)
                
                Text(text)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
            }
            
            TriangleShape()
                      .fill()
                      .frame(width: shapeScale, height: shapeScale)
                      .foregroundColor(isSelected ? Color.customBlueLight : Color.customBlueLight.opacity(0.5))
         }
      }
   }

struct PlanComponentView_Previews: PreviewProvider {
    static var previews: some View {
        PlanComponentView(text: "Basico", isSelected: true)
    }
}
