//
//  ContentView.swift
//  test
//
//  Created by apple on 5/20/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            AllUIView()
                .tabItem {
                    Label("Test", systemImage: "list.bullet")
                }
        }
    }
}

#Preview {
    ContentView()
}
