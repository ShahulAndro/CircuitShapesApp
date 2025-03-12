//
//  ShapeListView.swift
//  CircuitShapesApp
//
//  Created by Shahul Hameed Shaik on 12/03/2025.
//

import SwiftUI

struct ShapeListView: View {
    let shapes: [ShapeItem]
    let columns: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: 10), count: 3)
    var onShapeTap:((ShapeItem)-> Void)? = nil
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(shapes) { shape in
                        ShapeView(shapeType: shape.shapeType)
                            .frame(width: 80, height: 80)
                            .foregroundStyle(.blue)
                            .onTapGesture {
                                onShapeTap?(shape)
                            }
                    }
                }
                .padding()
            }
            .onChange(of: shapes.count) { oldValue, newValue in
                if let lastShape = shapes.last {
                    proxy.scrollTo(lastShape.id, anchor: .bottom)
                }
            }
        }
    }
}
