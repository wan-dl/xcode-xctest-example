//
//  MyView.swift
//  test
//
//  Created by hx on 5/20/24.
//

import SwiftUI

struct MyView: View {
    var body: some View {
        
        VStack {
            Text("Login Success!")
        }
        .onAppear() {
            print("this is myView.")
        }
        
    }
}

#Preview {
    MyView()
}
