//
//  Profile.swift
//  shrdded-rowdyhacks
//
//  Created by Aiden Seibel on 3/25/23.
//

import Foundation

struct user: Identifiable, Hashable{
    static func == (lhs: user, rhs: user) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id = UUID()
    
    var username, email, bio: String
    var dateJoined: Date
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}
