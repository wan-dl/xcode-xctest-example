//
//  t_input.swift
//  test
//
//  Created by apple on 5/23/24.
//

import SwiftUI

struct t_input: View {
    @State var username: String = ""
    @State var password: String = ""
    
    @State var shouldShowBtn: Bool = false
    
    @State private var isLoggedIn = false
    
    var body: some View {
        Form {
            Section() {
                TextField("username", text: $username)
                    .textFieldStyle(.plain)
                
                TextField("password", text: $password)
                    .textFieldStyle(.plain)
            }
            
            if shouldShowBtn {
                Button("Login Btn") {
                    login()
                }
            }
        }
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.shouldShowBtn = true
            }
        }
        .navigationTitle("TextField")
    }
    
    func login() {
        self.isLoggedIn = true
    }
}

#Preview {
    t_input()
}
