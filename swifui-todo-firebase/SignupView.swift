//
//  SignupView.swift
//  swifui-todo-firebase
//
//  Created by Sarath P on 24/01/22.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct SignupView: View {
    @State var navActive = false
    @State var email = ""
    @State var password = ""
    @State var errorMessage = ""
    var body: some View {
        
        VStack {
            VStack {
                Text("Greetings buddy !")
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 30))
                Text("Please fill the form.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.teal)
            }
            .padding()
                
            Spacer()
            
            
                
            VStack {
                HStack {
                    Image(systemName: "person.crop.circle.badge.exclamationmark")
                    TextField("Enter email address", text: $email)
                }
                .padding()

                HStack {
                    Image(systemName: "eyebrow")
                    TextField("Create a password", text: $password)
                }
                .padding()
                HStack {
                    Image(systemName: "eyebrow")
                    TextField("Re enter the password", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                }
                .padding()
                
                NavigationLink(isActive: $navActive) {
                    InsideView()
                } label: {
                    Button("SIGN UP") {
                        Auth.auth().createUser(withEmail: email, password: password) { result, error in
                            if error == nil {
                
                                errorMessage = "Signup success"
                                navActive = true
                                
                            } else {
                                errorMessage = "Please enter correct details"
                            }
                        }
                    }
                    .foregroundColor(.teal)
                    .buttonStyle(.bordered)
                    .padding()

                }

                            }
            Spacer()
            Text(errorMessage)
                .foregroundColor(.red)

        }
    }

}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
