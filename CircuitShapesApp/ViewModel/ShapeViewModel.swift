//
//  ShapeViewModel.swift
//  CircuitShapesApp
//
//  Created by Shahul Hameed Shaik on 11/03/2025.
//

import Foundation

class ShapeViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var errorMessage: String = ""
    @Published var shapeData: ShapeData?
    @Published var shapes: [ShapeItem] = []
    
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager = .shared) {
        self.networkManager = networkManager
    }
    
    @MainActor
    func fetchShapeData() async {
        self.isLoading = true
        self.errorMessage = ""
        
        do {
            let shapes: ShapeData = try await self.networkManager.fetchData(urlString: shapeUrlString)
            self.shapeData = shapes
            self.isLoading = false
        } catch {
            self.errorMessage = error.localizedDescription
            self.isLoading = false
        }
    }
    
    func addShape(_ shape: String) {
        let shapeItem = ShapeItem(shapeType: shape)
        self.shapes.append(shapeItem)
    }
    
    func removeAllShapes() {
        self.shapes.removeAll()
    }
    
    func shapesList(by: String)-> [ShapeItem] {
        return self.shapes.filter { $0.shapeType.lowercased().contains(by.lowercased()) }
    }
    
    func removeAll(by shape: String) {
        self.shapes.removeAll { shapeItem in
            shapeItem.shapeType.lowercased().contains(shape.lowercased())
        }
    }
    
    func removeLastItem(shape: String) {
        if let index = self.shapes.firstIndex(where: { $0.shapeType.lowercased().contains(shape.lowercased()) }) {
            self.shapes.remove(at: index)
            return
        }
    }

}
