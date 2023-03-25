//
//  Profile.swift
//  shrdded-rowdyhacks
//
//  Created by Aiden Seibel on 3/25/23.
//

import Foundation

struct profile: Identifiable, Hashable{
    static func == (lhs: profile, rhs: profile) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id = UUID()
    
    var username, name, bio: String
    var weight: Int
    var lifts: [lift]
    var dateJoined: Date
    var friends: [profile?]
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    mutating func addLift(type: String, amount: Int, desc: String){
        let currentPR = getCurrentPersonalRecordLiftFromLiftType(account: self, liftType: type)
        var isPR = false
        if amount > currentPR.amount{
            isPR = true
        }
        
        self.lifts.append(lift(type: type, amount: amount, date: Date(), isPersonalRecord: isPR))
    }
}

