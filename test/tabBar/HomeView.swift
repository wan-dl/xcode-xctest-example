//
//  HomeView.swift
//  test
//
//  Created by apple on 5/20/24.
//

import SwiftUI

struct HomeView: View {
    
    @State var username: String = "你好, 火星"
    
    var body: some View {
        
        NavigationView {
            List {
                NavigationLink("获取App 内存", destination: t_memory())
                NavigationLink("获取App CPU", destination: t_cpu_usage())
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
