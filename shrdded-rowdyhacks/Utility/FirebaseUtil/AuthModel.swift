//
//  AuthModel.swift
//  AuthPractice
//
//  Created by Aiden Seibel on 8/24/22.
//

import Foundation

class AuthModel: ObservableObject{
    @Published var isLoggedIn: Bool = false
    
    @Published var currentUserUserID: String = ""
    
    @Published var currentUserEmail: String = ""
    @Published var currentUserUsername: String = ""
    @Published var currentUserBio: String = ""
    @Published var currentUserDateJoined: Date = Date()
    @Published var currentUserFriends: [String] = []

    
    @Published var needsUserNameAndBio: Bool = true
}
