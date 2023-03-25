//
//  sampleData.swift
//  shrdded-rowdyhacks
//
//  Created by Aiden Seibel on 3/25/23.
//

import Foundation

var sampleLifts: [lift] = [
    lift(account: sampleProfiles[0], type: "bench", amount: 165, date: Date(), isPersonalRecord: true),
    lift(account: sampleProfiles[0], type: "bench", amount: 225, date: Date(), isPersonalRecord: false),
    lift(account: sampleProfiles[0], type: "bench", amount: 105, date: Date(), isPersonalRecord: false),
    lift(account: sampleProfiles[1], type: "squat", amount: 200, date: Date(), isPersonalRecord: true),
    lift(account: sampleProfiles[1], type: "squat", amount: 315, date: Date(), isPersonalRecord: false),
    lift(account: sampleProfiles[1], type: "squat", amount: 85, date: Date(), isPersonalRecord: false),
    lift(account: sampleProfiles[2], type: "deadlift", amount: 405, date: Date(), isPersonalRecord: true),
    lift(account: sampleProfiles[2], type: "deadlift", amount: 165, date: Date(), isPersonalRecord: false),
    lift(account: sampleProfiles[2], type: "deadlift", amount: 165, date: Date(), isPersonalRecord: false),
]


var sampleProfiles: [profile] = [
    profile(username: "aseibel", name: "Aiden", bio: "Trinity University '26 \nchasing aesthetics", weight: 155, lifts: [], dateJoined: Date(timeIntervalSinceNow: -4000000), friends: []),
    profile(username: "khoitran", name: "Khoi", bio: "Trinity University '26 \nalso chasing aesthetics", weight: 165, lifts: [], dateJoined: Date(timeIntervalSinceNow: -3500000), friends: []),
    profile(username: "levile23", name: "Levi", bio: "Trinity University '26 \n", weight: 155, lifts: [], dateJoined: Date(timeIntervalSinceNow: -9000000), friends: [])
]
