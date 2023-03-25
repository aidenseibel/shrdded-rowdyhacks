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
