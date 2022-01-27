//
//  SignupView.swift
//  swifui-todo-firebase
//
//  Created by Sarath P on 24/01/22.
//

import SwiftUI

struct SignupView: View {
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
                    TextField("Enter first name", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                }
                .padding()
                HStack {
                    Image(systemName: "person.crop.circle.badge.exclamationmark")
                    TextField("Enter Last name", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                }
                .padding()

                HStack {
                    Image(systemName: "eyebrow")
                    TextField("Create a password", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                }
                .padding()
                HStack {
                    Image(systemName: "eyebrow")
                    TextField("Re enter the password", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                }
                .padding()
                
                
                Button("SIGN UP") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                .foregroundColor(.teal)
                .buttonStyle(.bordered)
                .padding()
            }
            Spacer()
            Text("Please fill all fields")
                .foregroundColor(.red)
                .hidden()

        }
    }

}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
