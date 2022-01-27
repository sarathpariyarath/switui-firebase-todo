//
//  InsideView.swift
//  swifui-todo-firebase
//
//  Created by Sarath P on 27/01/22.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct InsideView: View {
    @Environment(\.presentationMode) var presentation
    @State var isActive = false
    let user = Auth.auth().currentUser?.email
    var body: some View {
        HStack {
            
            Text("Hello \(user!)")
            
            NavigationLink(isActive: $isActive) {
                ContentView()
            } label: {
                
                Button("Signout") {
                    do {
                        try Auth.auth().signOut()
                        isActive = true
                        loginState = false
                        UserDefaults.standard.set(loginState, forKey: "userLog")
                        presentation.wrappedValue.dismiss()
                    } catch {
                        print("error")
                    }
                }

            }
        }
        .navigationBarBackButtonHidden(true)
        
            
    }
}

struct InsideView_Previews: PreviewProvider {
    static var previews: some View {
        InsideView()
    }
}
