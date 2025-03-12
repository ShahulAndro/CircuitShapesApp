//
//  AppProgressView.swift
//  CircuitShapesApp
//
//  Created by Shahul Hameed Shaik on 12/03/2025.
//

import SwiftUI

struct AppProgressView: View {
    var body: some View {
        ZStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .frame(width: 80, height: 80)
        }
    }
}

#Preview {
    AppProgressView()
}
