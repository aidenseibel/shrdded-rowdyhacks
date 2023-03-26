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
    var lifts: [lift] = [lift(type: "bench", amount: 0, date: Date(), isPersonalRecord: false), lift(type: "squat", amount: 0, date: Date(), isPersonalRecord: false), lift(type: "deadlift", amount: 0, date: Date(), isPersonalRecord: false)]
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
        lifts.append(lift(type: type, amount: amount, date: Date(), isPersonalRecord: isPR))
        print(lifts)
    }
}

class currentUserObservableObject: ObservableObject{
    @Published var currentUser: profile = sampleProfiles[0]
}
