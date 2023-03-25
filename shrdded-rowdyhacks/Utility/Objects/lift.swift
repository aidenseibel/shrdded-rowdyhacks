//
//  lift.swift
//  shrdded-rowdyhacks
//
//  Created by Aiden Seibel on 3/25/23.
//

import Foundation
import SwiftUI

struct lift: Identifiable, Hashable{
    static func == (lhs: lift, rhs: lift) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id = UUID()
    
    var account: profile
    var type: String
    var amount: Int
    var date: Date
    var isPersonalRecord: Bool
    var description: String?
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

}

var sampleLifts: [lift] = [
    lift(account: sampleProfiles[0], type: "bench", amount: 165, date: Date(), isPersonalRecord: true),
    lift(account: sampleProfiles[0], type: "bench", amount: 225, date: Date(), isPersonalRecord: false),
    lift(account: sampleProfiles[0], type: "bench", amount: 105, date: Date(), isPersonalRecord: false),
    lift(account: sampleProfiles[0], type: "squat", amount: 200, date: Date(), isPersonalRecord: true),
    lift(account: sampleProfiles[0], type: "squat", amount: 315, date: Date(), isPersonalRecord: false),
    lift(account: sampleProfiles[0], type: "squat", amount: 85, date: Date(), isPersonalRecord: false),
    lift(account: sampleProfiles[0], type: "deadlift", amount: 405, date: Date(), isPersonalRecord: true),
    lift(account: sampleProfiles[0], type: "deadlift", amount: 165, date: Date(), isPersonalRecord: false),
    lift(account: sampleProfiles[0], type: "deadlift", amount: 165, date: Date(), isPersonalRecord: false),
]
