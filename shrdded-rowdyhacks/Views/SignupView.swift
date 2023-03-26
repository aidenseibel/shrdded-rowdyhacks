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
            Text("signup")
                .font(.title)
                .bold()
            
            VStack(alignment: .leading, spacing: 10){
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
                SecureField("confirm password", text: $confirmPassword)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(.gray, lineWidth: 2))
                
                //MARK: SUBMIT BUTTON
                Button(action: {
                    guard !email.isEmpty, !password.isEmpty, !confirmPassword.isEmpty, password == confirmPassword else {return}
                    AuthService.signup(email: email, password: password, authModel: authModel)
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
        }
        .padding()
    }
    
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
