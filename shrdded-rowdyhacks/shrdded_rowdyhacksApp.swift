//
//  shrdded_rowdyhacksApp.swift
//  shrdded-rowdyhacks
//
//  Created by Aiden Seibel on 3/25/23.
//

import SwiftUI
import FirebaseCore
import Firebase
import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct shrdded_rowdyhacksApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var dataManager = DataManager()
        
    @State var currentUser: user = user(username: "aseibel", email: "aseibel@trinity.edu", bio: "", dateJoined: Date())
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
                    .environmentObject(dataManager)
            }else{
                TabView{
                    FeedTab(accountName: currentUser.username)
                        .tabItem {
                            Label("Feed", systemImage: "house.fill")
                        }
//                    MapTab()
//                        .tabItem {
//                            Label("Map", systemImage: "map.fill")
//                        }
                    ProfileTab(dateJoined: Date(), allLifts: [], personalRecords: [])

                        .tabItem {
                            Label("Profile", systemImage: "figure.mind.and.body")
                        }
                }
                .environmentObject(authModel)
                .environmentObject(dataManager)

                .onAppear{
                    Auth.auth().addStateDidChangeListener { auth, user in
                        if user != nil{
                            authModel.isLoggedIn = true
                            print(authModel.isLoggedIn)
                            print(user?.email ?? "User not signed in.")
                            authModel.currentUserEmail = user?.email ?? "no email"
                            for user in dataManager.users{
                                if user.email == authModel.currentUserEmail{
                                    authModel.currentUserUsername = user.username
                                    authModel.currentUserBio = user.bio
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
