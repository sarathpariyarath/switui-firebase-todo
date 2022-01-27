//
//  ContentView.swift
//  swifui-todo-firebase
//
//  Created by Sarath P on 24/01/22.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

var loginState = UserDefaults.standard.bool(forKey: "userLog")

struct ContentView: View {
    let viewModel = ViewModel()
    @State var usernameTextField: String = ""
    @State var passwordTextField: String = ""
    @State var navStatus = false
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
                    NavigationLink(isActive: $navStatus) {
                        InsideView()
                    } label: {
                        Button("Sign in") {
                            
                            Auth.auth().signIn(withEmail: usernameTextField, password: passwordTextField) { result, error in
                                if error == nil {
//                                    guard let userEmail = Auth.auth().currentUser?.email else {return}
                                    print("Sign in success")
                                    loginState = true
                                    UserDefaults.standard.set(loginState, forKey: "userLog")
                                    navStatus = true
                                } else {
                                    print(error!)
                                }
                            }
                            print("Hello")
                        }
                        .padding(12.0)
                        .buttonStyle(.bordered)
                        .foregroundColor(.teal)
                    }


                                        
                    Text("Invalid entry")
                        .foregroundColor(.red)
                        .padding()
                        .hidden()
                    
                   
                    HStack {
                        Text("New here?")
                            .padding()
                        NavigationLink(destination:  SignupView()) {
                            Text("Create an account")
                                .foregroundColor(.teal)
                        }
                    
                    }
                    
                    Spacer()
                }
                .navigationBarBackButtonHidden(true)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 mini")
            .preferredColorScheme(.light)
    }
}
