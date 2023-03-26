//
//  SignupView.swift
//  AuthPractice
//
//  Created by Aiden Seibel on 8/24/22.
//

import SwiftUI
import Firebase

struct SignupView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State private var confirmPassword: String = ""
    
    @EnvironmentObject var authModel: AuthModel
        
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text("Signup")
                .font(.largeTitle)
                .bold()
            
            VStack(alignment: .leading, spacing: 10){
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
                SecureField("Confirm Password", text: $confirmPassword)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(.gray, lineWidth: 2))
                
                //MARK: SUBMIT BUTTON
                Button(action: {
                    guard !email.isEmpty, !password.isEmpty, !confirmPassword.isEmpty, password == confirmPassword else {return}
                    signup(email: email, password: password)
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
        }
        .padding()
    }
    
    func signup(email: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password){ result, error in
            if error != nil {
                print(error!.localizedDescription)
            }else{
                authModel.isLoggedIn = true
            }
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
