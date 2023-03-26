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
            Text("Login")
                .font(.largeTitle)
                .bold()
            
            VStack{
                TextField("Email", text: $email)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(.gray, lineWidth: 2))
                SecureField("Password", text: $password)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(.gray, lineWidth: 2))

            }
            
            //MARK: SUBMIT BUTTON
            Button(action: {
                guard !email.isEmpty, !password.isEmpty else {return}
                
                login(email: email, password: password)
                
            }, label: {
                HStack(alignment: .center, spacing: 0){
                    Spacer()
                    Text("Submit")
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
    
    func login(email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password){ result, error in
            if error != nil {
                print(error!.localizedDescription)
            }else{
                authModel.isLoggedIn = true
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
