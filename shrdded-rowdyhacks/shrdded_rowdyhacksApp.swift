//
//  shrdded_rowdyhacksApp.swift
//  shrdded-rowdyhacks
//
//  Created by Aiden Seibel on 3/25/23.
//

import SwiftUI

@main
struct shrdded_rowdyhacksApp: App {
    var currentUser: profile = sampleProfiles[0]
    
    var body: some Scene {
        WindowGroup {
            TabView{
                FeedTab()
                    .tabItem {
                        Label("Feed", systemImage: "house.fill")
                    }
                MapTab()
                    .tabItem {
                        Label("Map", systemImage: "map.fill")
                    }
                ProfileTab(profile: currentUser)
                    .tabItem {
                        Label("Profile", systemImage: "figure.mind.and.body")
                    }

            }
        }
    }
}
