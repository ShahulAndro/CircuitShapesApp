//
//  ShapeData.swift
//  CircuitShapesApp
//
//  Created by Shahul Hameed Shaik on 11/03/2025.
//

import Foundation

struct ShapeData: Codable {
    let buttons: [ButtonData]
}

struct ButtonData: Identifiable, Codable {
    let id = UUID()
    let name: String
    let drawPath: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case drawPath = "draw_path"
    }
}
