//
//  TriangleShape.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 21/02/2025.
//

import SwiftUI

struct TriangleShape: Shape {
    
    let spaceBetweenShapes: CGFloat = 40.0
    
    let shapeScale: CGFloat = 20.0
    
    let strokeWidth: CGFloat = 3.0
    
    let xOffset: CGFloat = 15.0
    func path(in bounds: CGRect) -> Path {
        let vertex1 = CGPoint(x: shapeScale / 2 + xOffset, y: shapeScale)
        let vertex2 = CGPoint(x: 0.0 + xOffset, y: 0.0)
        let vertex3 = CGPoint(x: shapeScale + xOffset, y: 0.0)
        var path = Path()
        
        path.move(to: vertex1)
        path.addLine(to: vertex2)
        path.addLine(to: vertex3)
        
        path.closeSubpath()
        
        return path
    }
}
