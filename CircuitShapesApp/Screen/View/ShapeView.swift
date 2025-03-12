//
//  ShapeView.swift
//  CircuitShapesApp
//
//  Created by Shahul Hameed Shaik on 12/03/2025.
//

import SwiftUI

struct ShapeView: View {
    let shapeType: String
    
    var body: some View {
        AnyShape(createShape(from: shapeType))
        .foregroundStyle(.blue)
    }
    
    private func createShape(from type: String) -> any Shape {
        switch shapeType.lowercased() {
        case "circle":
            return Circle()
        case "square":
            return Rectangle()
        case "triangle":
            return Triangle()
        default:
            return Circle()
        }
    }
}
