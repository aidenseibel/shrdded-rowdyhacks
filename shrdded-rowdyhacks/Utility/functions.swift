//
//  functions.swift
//  shrdded-rowdyhacks
//
//  Created by Aiden Seibel on 3/25/23.
//

import Foundation

func getAllLiftTypes(account: profile) -> [String]{
    var liftTypes: [String] = []
    for lift in account.lifts{
        if !liftTypes.contains(lift.type){
            liftTypes.append(lift.type)
        }
    }
    return liftTypes
}

func getLiftsFromType(account: profile, liftType: String) -> [lift] {
    var allLiftsForType: [lift] = []
    for lift in account.lifts{
        if lift.type == liftType{
            allLiftsForType.append(lift)
        }
    }
    return allLiftsForType
}


//MUST HAVE LIFTS OF TYPE TO NOT FAIL
func getCurrentPersonalRecordLiftFromLiftType(account: profile, liftType: String) -> lift{
    let allLifts: [lift] = getLiftsFromType(account: account, liftType: liftType)
    var maxLift = allLifts[0]
    var maximumAmount = maxLift.amount
    
    for lift in allLifts {
        if lift.amount > maximumAmount{
            maximumAmount = lift.amount
            maxLift = lift
        }
    }
    
    return maxLift
}

func getAllCurrentPersonalRecordsForAllTypes(account: profile) -> [lift]{
    let allTypes = getAllLiftTypes(account: account)
    var prs: [lift] = []
    for type in allTypes{
        prs.append(getCurrentPersonalRecordLiftFromLiftType(account: account, liftType: type))
    }
    return prs
}

func getAllPersonalRecordsFromLiftType(account: profile, liftType: String) -> [lift]{
    let allLifts: [lift] = getLiftsFromType(account: account, liftType: liftType)
    var allPersonalRecords: [lift] = []
    
    for lift in allLifts {
        if lift.isPersonalRecord{
            allPersonalRecords.append(lift)
            
        }
    }
    return allPersonalRecords
}

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
