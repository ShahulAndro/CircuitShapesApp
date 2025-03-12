//
//  ShapeMainScreen.swift
//  CircuitShapesApp
//
//  Created by Shahul Hameed Shaik on 11/03/2025.
//

import SwiftUI

/// Main view for displaying shapes and interacting with shape-related actions.
struct ShapeMainScreen: View {
    @State private var selectedShape: String = ""
    @StateObject private var viewModel = ShapeViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    AppProgressView()
                } else if !viewModel.errorMessage.isEmpty {
                    ErrorView(errorMessage: viewModel.errorMessage)
                } else {
                    VStack {
                        HStack(spacing: 50) {
                            Button("Clear All") { viewModel.removeAllShapes() }
                            Spacer()
                            NavigationLink("Edit Circles",destination: EditShapeScreen(shape: "Circle", viewModel: viewModel)) // Navigation link to edit "Circle" shapes only.
                            .padding()
                            
                            // Uncomment the following code if you need to dynamically edit the selected shape (other than Circle).
                            // Currently, editing "Circle" only.
//                            if !selectedShape.isEmpty {
//                                NavigationLink(
//                                    "Edit \(selectedShape)s",
//                                    destination: EditShapeScreen(shape: selectedShape, viewModel: viewModel))
//                                .padding()
//                            }
                        }
                        .padding(.horizontal, 12)
                        .frame(maxWidth: .infinity)
                        
                        ShapeListView(shapes: viewModel.shapes) { shape in
                            selectedShape = shape.shapeType
                        }
                        Spacer()
                        if let buttons = viewModel.shapeData?.buttons {
                            HorizontalShapeButtonViews(buttons: buttons, action: { buttonData in
                                    viewModel.addShape(buttonData.drawPath)
                                }
                            )
                        }
                    }
                }
            }
            .task {
                await viewModel.fetchShapeData() // Fetch shape data asynchronously when the view appears.
            }
        }
    }
}
