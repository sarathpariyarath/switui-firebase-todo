//
//  ContentView.swift
//  swifui-todo-firebase
//
//  Created by Sarath P on 24/01/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var usernameTextField: String = ""
    @State var passwordTextField: String = ""
    @State var signUpActive = false
    @State var showError = false
    var body: some View {
        
        
            
                VStack() {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                    Spacer()
                    Text("Hey, \nLogin Here")
                        .font(.system(size: 30))
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    Spacer()
                    VStack(spacing: 7) {
                        HStack {
                            Image(systemName: "person.crop.circle.fill")
                            TextField("Phone number or email", text: $usernameTextField)
                                
                            
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        
                        HStack {
                            Image(systemName: "eye.circle.fill")
                            SecureField("Password", text: $passwordTextField)
                           
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                    }
                    
                    Button("Sign in") {
                        print("Hello")
                    }
                    .padding(12.0)
                    .buttonStyle(.bordered)
                    .foregroundColor(.teal)
                    
                    Text("Invalid entry")
                        .foregroundColor(.red)
                        .padding()
                        .hidden()
                    
                   
                    HStack {
                        Text("New here?")
                            .padding()
                        NavigationLink(destination: SignupView()) {
//                            Button("Create an account") {
//                            signUpActive = true
//                                print(passwordTextField)
//                            }
//                            .foregroundColor(.teal)
                            Text("Create an account")
                                .foregroundColor(.teal)
                        }
                    
                    }
                    
                    Spacer()
                }
            
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 mini")
            .preferredColorScheme(.light)
    }
}
