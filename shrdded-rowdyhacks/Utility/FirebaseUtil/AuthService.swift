//
//  AuthService.swift
//  shrdded-rowdyhacks
//
//  Created by Aiden Seibel on 3/26/23.
//

import Foundation
import Firebase


class AuthService{
    static let instance = AuthService()
    
    //MARK: AUTH USER FUNCTIONS
    static func signup(email: String, password: String, authModel: AuthModel){
        Auth.auth().createUser(withEmail: email, password: password){ result, error in
            if error != nil {
                print(error!.localizedDescription)
            }else{
                authModel.isLoggedIn = true
            }
        }
    }
    
    static func login(email: String, password: String, authModel: AuthModel){
        Auth.auth().signIn(withEmail: email, password: password){ result, error in
            if error != nil {
                print(error!.localizedDescription)
            }else{
                authModel.isLoggedIn = true
            }
        }
    }
}
