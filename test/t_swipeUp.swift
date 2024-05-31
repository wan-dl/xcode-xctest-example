//
//  t_swipeUp.swift
//  test
//
//  Created by apple on 5/31/24.
//

import SwiftUI

struct t_swipeUp: View {
    
    @State private var num = 0
        
    var body: some View {
        ScrollView {
            Text("刷新次数: \(num)")
        }
        .refreshable {
            await incrementNumber()
        }
        .navigationTitle("SwipeUp")
        .navigationBarTitleDisplayMode(.inline)

    }
    
    func incrementNumber() async {
        try? await Task.sleep(nanoseconds: 1_000_000_000) // 1 second
        num += 1
    }
    
}

#Preview {
    t_swipeUp()
}
