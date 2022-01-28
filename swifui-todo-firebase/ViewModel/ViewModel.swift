//
//  ViewModel.swift
//  swifui-todo-firebase
//
//  Created by Sarath P on 27/01/22.
//

import Foundation
import FirebaseFirestore
import UIKit
import SwiftUI

class ViewModel: ObservableObject {
    @Published var list = [Todo]()
    
    func getTodo(email: String) {
        let db = Firestore.firestore()
        db.collection("users").document(email).collection("todos").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.list = snapshot.documents.map({ document in
                            print("------")
                            print(document.documentID)
                            print("------")
                            return Todo(id: document.documentID, titleName: document["titleName"] as? String ?? "", isCompleted: document["isCompleted"] as? Bool ?? false)
                        })
                    }
                }
            }
        }
    }
    
    func addNewTodo(email: String, taskName: String) {
        let db = Firestore.firestore()
        db.collection("users").document(email).collection("todos").addDocument(data: ["titleName" : taskName, "isCompleted" : false])
        getTodo(email: email)
    }
    
    func deleteTodo(email: String, todo: Todo){
        let db = Firestore.firestore()
        db.collection("users").document(email).collection("todos").document(todo.id).delete()
        getTodo(email: email)
        
    }
    
    func setIsCompleted(todo: Todo, email: String, status: Bool) {
        let db = Firestore.firestore()
        db.collection("users").document(email).collection("todos").document(todo.id).setData(["isCompleted" : status, "titleName": todo.titleName])
        getTodo(email: email)
    }
}
