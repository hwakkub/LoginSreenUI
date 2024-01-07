//
//  ContentView.swift
//  LoginSreenUI
//
//  Created by jirakit on 8/1/2567 BE.
//

import SwiftUI


struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongPassword = 0
    @State private var wrongUsername = 0
    @State private var showingLoginScreen = false
    
    var body: some View {
        NavigationView {
            ZStack{
                Color.blue.ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                
                VStack {
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("Username",text:$username)
                        .padding()
                        .frame(width: 300,height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red,width: CGFloat(wrongUsername))
                    SecureField("Password",text: $password)
                        .padding()
                        .frame(width: 300,height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red,width: CGFloat(wrongPassword))
                    Button("Login"){
                        autheticateUser(username: username, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300,height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    NavigationLink(
                                destination: LoginScreenView(showingLoginScreen: $showingLoginScreen),
                                isActive: $showingLoginScreen
                            ) {
                                EmptyView()
                            }
                    
//                    NavigationLink(destination: Text("You are logged in @\(username)"), isActive: $showingLoginScreen){
//                        EmptyView()
//                    }


                }
            }
        }.navigationBarHidden(true)
    }
    func autheticateUser(username:String,password:String){
        if username.lowercased() == "hwak123" {
            wrongUsername = 0
            if password.lowercased() == "123456" {
                wrongPassword = 0
                showingLoginScreen = true
            } else {
                wrongPassword = 2
            }
            
        } else {
            wrongUsername = 2
        }
    }
    
}

struct LoginScreenView: View {
    @Binding var showingLoginScreen: Bool

    var body: some View {
        VStack {
            Text("welcome")
        }
    }
}


#Preview {
    ContentView()
}
