//
//  t_silder.swift
//  test
//
//  Created by apple on 5/29/24.
//

import SwiftUI

struct t_silder: View {
    
    @State private var speed: Float = 50.0
    @State private var isEditing = false
    
    var body: some View {
        VStack {
            Slider(
                value: $speed,
                in: 0...100,
                onEditingChanged: { editing in
                    isEditing = editing
                }
            )
            .accessibilityIdentifier("SpeedSlider")
            
            Text("\(speed)")
                .foregroundColor(isEditing ? .red : .blue)
                .accessibilityIdentifier("SpeedText")
        }
    }
}

#Preview {
    t_silder()
}
