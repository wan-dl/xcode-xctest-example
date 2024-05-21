//
//  ContentView.swift
//  test
//
//  Created by hx on 5/20/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            ShareView()
                .tabItem {
                    Label("Share", systemImage: "square.and.arrow.up.circle.fill")
                }
        }
        .onAppear() {
            print("==============")
        }
        
    }
}

#Preview {
    ContentView()
}
