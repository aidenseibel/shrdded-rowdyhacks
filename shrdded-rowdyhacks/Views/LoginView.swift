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
    @EnvironmentObject var dataManager: DataManager
    
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
                
                login(email: email, password: password, authModel: authModel)
                
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
    
    func login(email: String, password: String, authModel: AuthModel){
        Auth.auth().signIn(withEmail: email, password: password){ result, error in
            if error != nil {
                print(error!.localizedDescription)
            }else{
                authModel.needsUserNameAndBio = false
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
