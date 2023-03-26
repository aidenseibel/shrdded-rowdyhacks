//
//  gym.swift
//  shrdded-rowdyhacks
//
//  Created by Aiden Seibel on 3/26/23.
//

import Foundation
import MapKit

struct gym: Identifiable{
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

let gymNames: [String] = ["Golds Gym", "Harry's Gym", "Beachside Gym", "LA Fitness", "Planet Fitness"]
