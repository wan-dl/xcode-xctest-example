//
//  AllUIView.swift
//  test
//
//  Created by apple on 5/23/24.
//

import SwiftUI

struct AllUIView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("input", destination: t_input())
                NavigationLink("button", destination: t_button())
                NavigationLink("slider", destination: t_silder())
                NavigationLink("swipe-up", destination: t_swipeUp())
            }
            .navigationTitle("Test")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

#Preview {
    AllUIView()
}
