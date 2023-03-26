//
//  sampleData.swift
//  shrdded-rowdyhacks
//
//  Created by Aiden Seibel on 3/25/23.
//

import Foundation

var sampleLifts: [lift] = [
    lift(liftID: "", userID: "", type: "bench", amount: 85, dateCreated: Date(timeIntervalSinceNow: -2000), isPersonalRecord: true),
    lift(liftID: "", userID: "", type: "bench", amount: 135, dateCreated: Date(timeIntervalSinceNow: -45000), isPersonalRecord: false),
    lift(liftID: "", userID: "", type: "bench", amount: 270, dateCreated: Date(timeIntervalSinceNow: -120000), isPersonalRecord: true),
    lift(liftID: "", userID: "", type: "squat", amount: 185, dateCreated: Date(timeIntervalSinceNow: -3400), isPersonalRecord: false),
    lift(liftID: "", userID: "", type: "squat", amount: 315, dateCreated: Date(timeIntervalSinceNow: -610000), isPersonalRecord: false),
    lift(liftID: "", userID: "", type: "squat", amount: 85, dateCreated: Date(timeIntervalSinceNow: -32000), isPersonalRecord: false),
    lift(liftID: "", userID: "", type: "deadlift", amount: 300, dateCreated: Date(timeIntervalSinceNow: -17000), isPersonalRecord: false),
    lift(liftID: "", userID: "", type: "deadlift", amount: 805, dateCreated: Date(timeIntervalSinceNow: -850000), isPersonalRecord: true),
    lift(liftID: "", userID: "", type: "deadlift", amount: 225, dateCreated: Date(timeIntervalSinceNow: -90000), isPersonalRecord: false)
]


var sampleProfiles: [profile] = [
    profile(username: "aseibel", name: "Aiden", bio: "Trinity University '26 \nchasing aesthetics", weight: 155, dateJoined: Date(timeIntervalSinceNow: -4000000), friends: []),
    profile(username: "khoitran", name: "Khoi", bio: "Trinity University '26 \nalso chasing aesthetics", weight: 165, dateJoined: Date(timeIntervalSinceNow: -3500000), friends: []),
    profile(username: "levile23", name: "Levi", bio: "Trinity University '26 \n", weight: 155, dateJoined: Date(timeIntervalSinceNow: -9000000), friends: [])
]
