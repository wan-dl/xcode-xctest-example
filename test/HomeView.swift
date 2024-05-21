//
//  HomeView.swift
//  test
//
//  Created by hx on 5/20/24.
//

import SwiftUI

struct HomeView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    @State private var isLoggedIn = false
    
    var body: some View {
        NavigationView {
            Form {
                Section() {
                    TextField("username", text: $username)
                        .textFieldStyle(.plain)
                    
                    TextField("password", text: $password)
                        .textFieldStyle(.plain)
                }
                
                NavigationLink(destination: MyView(), isActive: $isLoggedIn) {
                    Button("Login") {
                        login()
                    }
                }
            }
        }
    }
    
    func login() {
        self.isLoggedIn = true
        print("-------------------")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
