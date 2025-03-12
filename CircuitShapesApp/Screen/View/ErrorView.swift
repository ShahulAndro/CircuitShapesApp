//
//  ErrorView.swift
//  CircuitShapesApp
//
//  Created by Shahul Hameed Shaik on 12/03/2025.
//

import SwiftUI

struct ErrorView: View {
    let errorMessage: String
    var body: some View {
        ZStack {
            Text(errorMessage)
                .font(.title)
                .foregroundColor(.red)
                .padding()
        }
    }
}
