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
