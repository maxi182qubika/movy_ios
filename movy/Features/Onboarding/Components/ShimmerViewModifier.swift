//
//  ShimmerModifier.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 03/04/2025.
//

import SwiftUI

struct ShimmerEffectBox: View {
    private var gradientColors = [
        Color(uiColor: UIColor(Color.customTabBgColor)),
        Color(uiColor: UIColor(Color.customMovyGradientLight)),
        Color(uiColor: UIColor(Color.customTabBgColor))
    ]
    @State var startPoint: UnitPoint = .init(x: -1.8, y: -1.2)
    @State var endPoint: UnitPoint = .init(x: 0, y: -0.2)
    var body: some View {
        LinearGradient (colors: gradientColors,
                        startPoint: startPoint,
                        endPoint: endPoint)
        .onAppear {
            withAnimation (.easeInOut (duration: 1.5)
                .repeatForever (autoreverses: false)) {
                    startPoint = .init(x: 1, y: 1)
                    endPoint = .init(x: 2.2, y: 2.2)
                }
        }
    }
}
struct ShimmerEffectBox_Previews: PreviewProvider {
    static var previews : some View {
        ShimmerEffectBox()
    }
}
