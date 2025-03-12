//
//  EditShapeScreen.swift
//  CircuitShapesApp
//
//  Created by Shahul Hameed Shaik on 12/03/2025.
//

import SwiftUI

/// A screen for editing a specific type of shape (e.g., Circle) where the user can view, add, or remove shapes.
struct EditShapeScreen: View {
    //Shape will be helpful to manage screen with dynamic shapes
    var shape: String
    @ObservedObject var viewModel: ShapeViewModel
    
    var body: some View {
        VStack {
            ShapeListView(shapes: viewModel.shapesList(by: shape))
            Spacer()
            HStack {
                Button("Delete All") { viewModel.removeAll(by: shape) }
                Spacer()
                Button("Add") { viewModel.addShape(shape) }
                Spacer()
                Button("Remove") { viewModel.removeLastItem(shape: shape) }
            }
            .padding(.horizontal, 12)
            .frame(maxWidth: .infinity)
        }
    }
}
