//
//  sampleData.swift
//  shrdded-rowdyhacks
//
//  Created by Aiden Seibel on 3/25/23.
//

import Foundation

var sampleLifts: [lift] = [
    lift(type: "bench", amount: 85, date: Date(timeIntervalSinceNow: -2000), isPersonalRecord: true),
    lift(type: "bench", amount: 135, date: Date(timeIntervalSinceNow: -45000), isPersonalRecord: false),
    lift(type: "bench", amount: 270, date: Date(timeIntervalSinceNow: -12000), isPersonalRecord: true),
    lift(type: "squat", amount: 185, date: Date(timeIntervalSinceNow: -3400), isPersonalRecord: false),
    lift(type: "squat", amount: 315, date: Date(timeIntervalSinceNow: -6700), isPersonalRecord: false),
    lift(type: "squat", amount: 85, date: Date(timeIntervalSinceNow: -32000), isPersonalRecord: false),
    lift(type: "deadlift", amount: 300, date: Date(timeIntervalSinceNow: -17000), isPersonalRecord: false),
    lift(type: "deadlift", amount: 805, date: Date(timeIntervalSinceNow: -8000), isPersonalRecord: true),
    lift(type: "deadlift", amount: 225, date: Date(timeIntervalSinceNow: -90000), isPersonalRecord: false)
]


var sampleProfiles: [profile] = [
    profile(username: "aseibel", name: "Aiden", bio: "Trinity University '26 \nchasing aesthetics", weight: 155, lifts: [], dateJoined: Date(timeIntervalSinceNow: -4000000), friends: []),
    profile(username: "khoitran", name: "Khoi", bio: "Trinity University '26 \nalso chasing aesthetics", weight: 165, lifts: [], dateJoined: Date(timeIntervalSinceNow: -3500000), friends: []),
    profile(username: "levile23", name: "Levi", bio: "Trinity University '26 \n", weight: 155, lifts: [], dateJoined: Date(timeIntervalSinceNow: -9000000), friends: [])
]
