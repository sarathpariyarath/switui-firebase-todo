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
    @ObservedObject var modal = ViewModel()
    @Environment(\.presentationMode) var presentation
    @State var isActive = false
    @State var todoName = ""
    
    init() {
        guard let user = Auth.auth().currentUser?.email else { return }
        modal.getTodo(email: user)
        
        print("user \(user)")
        
    }
    var body: some View {
        VStack {
            Text("Welcome back user ! 😆")
                .foregroundColor(.teal)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .font(.system(size: 20))
            VStack {
                
                Spacer()
                
                List (modal.list) { items in
                    HStack {
                        if items.isCompleted == true {
                            Image(systemName: "checkmark.circle")
                        } else if items.isCompleted == false {
                            Image(systemName: "circle")
                        }
                        
                        
                        Text(items.titleName)

                        Spacer()
                        
                        Button {
                            guard let user = Auth.auth().currentUser?.email else { return }
                            modal.deleteTodo(email: user, todo: items)
                        } label: {
                            Image(systemName: "trash.circle.fill")
                        }
                        .buttonStyle(.borderless)
                        .foregroundColor(.teal)
                        

                    }.swipeActions(edge: .trailing) {
                        
                        Button {
                            var status: Bool = items.isCompleted
                            status.toggle()
                            guard let user = Auth.auth().currentUser?.email else { return }
                            modal.setIsCompleted(todo: items, email: user, status: status)
                        } label: {
                            Text("Mark as Completed")
                        }

                    }
                }
                
                HStack {
                    TextField("Add new Todo here", text: $todoName)
                        
                    Button {
                        guard let user = Auth.auth().currentUser?.email else { return }
                        modal.addNewTodo(email: user , taskName: todoName)
                        todoName = ""
                    } label: {
                        Image(systemName: "plus.circle")
                            .foregroundColor(.teal)
                    }
                    

                }
                .padding()

                
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
                    .buttonStyle(.bordered)
                    .foregroundColor(.teal)
                    .padding()
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
        
            
    }
}

struct InsideView_Previews: PreviewProvider {
    static var previews: some View {
        InsideView()
    }
}
