//
//  shrdded_rowdyhacksApp.swift
//  shrdded-rowdyhacks
//
//  Created by Aiden Seibel on 3/25/23.
//

import SwiftUI

@main
struct shrdded_rowdyhacksApp: App {
    var body: some Scene {
        WindowGroup {
            TabView{
                FeedView()
                    .tabItem {
                        Label("Feed", systemImage: "house.fill")
                    }
                MapView()
                    .tabItem {
                        Label("Map", systemImage: "map.fill")
                    }
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "figure.mind.and.body")
                    }

            }
        }
    }
}
