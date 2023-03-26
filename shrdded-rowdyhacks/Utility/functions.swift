//
//  functions.swift
//  shrdded-rowdyhacks
//
//  Created by Aiden Seibel on 3/25/23.
//

import Foundation

func getTimeSinceNow(from: Date) -> String{
    let now = Date.now
    let intervalBetweenTimes = from.distance(to: now)
    if intervalBetweenTimes < 3600{
        return "\(String(format: "%.0f", intervalBetweenTimes / 60)) mins ago"
    }else if intervalBetweenTimes > 3600 && intervalBetweenTimes < 86400{
        return "\(String(format: "%.0f", intervalBetweenTimes / 3600)) hours ago"
    }else if intervalBetweenTimes > 86400{
        return "\(String(format: "%.0f", intervalBetweenTimes / 86400)) days ago"
    }
    return ""
}


func checkIfTextIsAppropriate(input: String) -> Bool{
    return true
}

func getAllLiftsFromEmail(email: String, lifts: [lift]) -> [lift]{
    var allLifts: [lift] = []
    for everyLift in lifts{
        if everyLift.userEmail == email{
            allLifts.append(everyLift)
        }
    }
    return allLifts
}

func getAllLiftTypesfromEmail(email: String, lifts: [lift]) -> [String]{
    var types: [String] = []
    let allLifts = getAllLiftsFromEmail(email: email, lifts: lifts)
    for everyLift in allLifts{
        if !types.contains(everyLift.type){
            types.append(everyLift.type)
        }
    }
    return types
}

func getAllPRsFromEmail(email: String, lifts: [lift]) -> [lift]{
    var prs : [lift] = []
    let allTypes = getAllLiftTypesfromEmail(email: email, lifts: lifts)
    let allLifts = getAllLiftsFromEmail(email: email, lifts: lifts)
    for everyType in allTypes{
        var maxAmount = 0
        var maxLift = lift(userEmail: email, type: everyType, amount: 0, dateCreated: Date())
        for everyLift in allLifts{
            if everyLift.type == everyType && everyLift.amount > maxAmount{
                maxLift = everyLift
                maxAmount = everyLift.amount
            }
        }
        prs.append(maxLift)
    }
    return prs
}

func getAllLiftsOfTypeFromEmail(email: String, liftType: String, lifts: [lift]) -> [lift]{
    var allLiftsOfType: [lift] = []
    let allLifts = getAllLiftsFromEmail(email: email, lifts: lifts)
    for everyLift in allLifts{
        if everyLift.type == liftType{
            allLiftsOfType.append(everyLift)
        }
    }
    return allLiftsOfType
}

func sortLiftArrayByTimeWithEarliestFirst(lifts: [lift]) ->[lift]{
    var arr: [lift] = lifts
    arr.sort{
        $0.dateCreated < $1.dateCreated
    }
    return arr
}

func returnFirstFiveInArray(arr: [Any]) -> [Any]{
    if arr.count < 5{
        return arr
    }else {
        return Array(arr[0..<5])
        
    }
}

