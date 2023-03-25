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
//    var prs: [lift]
    var goals: [goal]
    var dateJoined: Date
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

var sampleProfiles: [profile] = [
    profile(username: "aseibel", name: "Aiden", bio: "Trinity University '26 \nchasing aesthetics", weight: 155, lifts: [], goals: [], dateJoined: Date(timeIntervalSinceNow: -4000000)),
    profile(username: "khoitran", name: "Khoi", bio: "Trinity University '26 \nalso chasing aesthetics", weight: 165, lifts: [], goals: [], dateJoined: Date(timeIntervalSinceNow: -3500000)),
    profile(username: "levile23", name: "Levi", bio: "Trinity University '26 \n", weight: 155, lifts: [], goals: [], dateJoined: Date(timeIntervalSinceNow: -9000000))


    
]
