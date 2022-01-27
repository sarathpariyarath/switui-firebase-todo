//
//  File.swift
//  swifui-todo-firebase
//
//  Created by Sarath P on 27/01/22.
//

import Foundation
import FirebaseAuth
import SwiftUI

class FirebaseHelper {
    func createNewUser(email: String, password: String) {
        let auth = Auth.auth()
        auth.createUser(withEmail: email, password: password) { result, error in
            if error == nil {
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
        }
    }
}

