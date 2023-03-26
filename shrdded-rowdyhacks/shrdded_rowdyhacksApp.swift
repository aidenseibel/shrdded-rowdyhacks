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
                    VStack(alignment: .leading) {
                        Text("welcome to shrdded")
                            .font(.largeTitle)
                            .bold()
                            .padding(EdgeInsets(top: 10, leading: 10, bottom: 1, trailing: 1))
                        Text("it's nice to have you")
                            .font(.title3)
                            .padding(EdgeInsets(top: 1, leading: 10, bottom: 1, trailing: 1))
                        LoginView()
                        SignupView()
                    }
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
