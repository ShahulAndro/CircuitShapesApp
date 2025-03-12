//
//  HorizontalShapeButtonViews.swift
//  CircuitShapesApp
//
//  Created by Shahul Hameed Shaik on 11/03/2025.
//

import SwiftUI

struct HorizontalShapeButtonViews: View {
    let buttons: [ButtonData]
    let action: (ButtonData)-> Void
    
    private let rows = [GridItem(.adaptive(minimum: 100), spacing: 5)]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 40) {
                ForEach(buttons) { buttonData in
                    Button(buttonData.name, action: {
                        action(buttonData)
                    })
                    Spacer()
                }
            }
            .padding(.horizontal, 12)
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    HorizontalShapeButtonViews(
        buttons: [ButtonData(name: "Circle", drawPath: "Circle"), ButtonData(name: "Square", drawPath: "Square")],
        action: {_ in 
            
        }
    )
}
