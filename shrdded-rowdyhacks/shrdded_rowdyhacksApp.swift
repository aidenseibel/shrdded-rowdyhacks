//
//  shrdded_rowdyhacksApp.swift
//  shrdded-rowdyhacks
//
//  Created by Aiden Seibel on 3/25/23.
//

import SwiftUI
import FirebaseCore
import Firebase


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct shrdded_rowdyhacksApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @State var currentUser: profile = sampleProfiles[0]
    
    @StateObject var authModel: AuthModel = AuthModel()

    
    var body: some Scene {
        WindowGroup {
            if !authModel.isLoggedIn{
                ScrollView{
                    LoginView()
                    SignupView()
                }
                    .environmentObject(authModel)
            }else{
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
                .environmentObject(authModel)
                .onAppear{
                    Auth.auth().addStateDidChangeListener { auth, user in
                        if user != nil{
                            authModel.isLoggedIn = true
                            print(authModel.isLoggedIn)
                            print(user?.email ?? "User not signed in.")
                        }
                    }
                }
            }

        }
    }
}
