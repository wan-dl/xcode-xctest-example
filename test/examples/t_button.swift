//
//  t_button.swift
//  test
//
//  Created by apple on 5/27/24.
//

import SwiftUI

struct t_button: View {
    var body: some View {
        
        Button(LocalizedStringKey("Open"), action: {
            
        }).buttonStyle(.automatic)
    }
}

#Preview {
    t_button()
}
