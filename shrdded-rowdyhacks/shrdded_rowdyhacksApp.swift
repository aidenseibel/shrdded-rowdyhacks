//
//  shrdded_rowdyhacksApp.swift
//  shrdded-rowdyhacks
//
//  Created by Aiden Seibel on 3/25/23.
//

import SwiftUI

@main
struct shrdded_rowdyhacksApp: App {
    @State var currentUser: profile = sampleProfiles[0]
    
    var body: some Scene {
        WindowGroup {
            TabView{
                FeedTab(accountName: currentUser.username)
                    .tabItem {
                        Label("Feed", systemImage: "house.fill")
                    }
                MapTab()
                    .tabItem {
                        Label("Map", systemImage: "map.fill")
                    }
                ProfileTab(accountName: currentUser.username, accountBio: currentUser.bio, dateJoined: currentUser.dateJoined, allLifts: sampleLifts, personalRecords: sampleLifts)
                    .tabItem {
                        Label("Profile", systemImage: "figure.mind.and.body")
                    }

            }
        }
    }
}
