//
//  ContentView.swift
//  AuthPractice
//
//  Created by Aiden Seibel on 8/24/22.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    @EnvironmentObject var authModel: AuthModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text("login")
                .font(.title)
                .bold()
            
            VStack{
                TextField("email", text: $email)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(.gray, lineWidth: 2))
                SecureField("password", text: $password)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(.gray, lineWidth: 2))

            }
            
            //MARK: SUBMIT BUTTON
            Button(action: {
                guard !email.isEmpty, !password.isEmpty else {return}
                
                AuthService.login(email: email, password: password, authModel: authModel)
                
            }, label: {
                HStack(alignment: .center, spacing: 0){
                    Spacer()
                    Text("submit")
                       .foregroundColor(.white)
                       .bold()
                       .padding()
                    Spacer()
                }
                .background(Color("darkgreen"))
                .cornerRadius(15)
            })
            
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
