//
//  swifui_todo_firebaseApp.swift
//  swifui-todo-firebase
//
//  Created by Sarath P on 24/01/22.
//

import SwiftUI
import Firebase

@main
struct swifui_todo_firebaseApp: App {
    var content = ContentView()
    init() {
        FirebaseApp.configure()
      
    }
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if loginState == false {
                    ContentView()
                } else {
                    InsideView()
                }
                
            }
        }
    }
}
