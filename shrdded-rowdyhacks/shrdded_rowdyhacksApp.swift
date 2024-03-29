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
                    FeedTab()
                        .tabItem {
                            Label("Feed", systemImage: "house.fill")
                        }
                    MapTab()
                        .tabItem {
                            Label("Map", systemImage: "map.fill")
                        }
                    ProfileTab()
                        .tabItem {
                            Label("Profile", systemImage: "figure.mind.and.body")
                        }
                }
                .environmentObject(authModel)
                .environmentObject(dataManager)
                .fullScreenCover(isPresented: $authModel.needsUserNameAndBio, content: {
                    FinalizeAccountCreation(email: $authModel.currentUserEmail)
                        .environmentObject(authModel)
                        .environmentObject(dataManager)

                })

                .onAppear{
                    Auth.auth().addStateDidChangeListener { auth, user in
                        if user != nil{
                            authModel.currentUserEmail = user?.email ?? "no email"
                            for user in dataManager.users{
                                if user.email == authModel.currentUserEmail{
                                    authModel.currentUserUserID = user.id.uuidString
                                    authModel.currentUserUsername = user.username
                                    authModel.currentUserBio = user.bio
                                    authModel.currentUserDateJoined = user.dateJoined
                                    authModel.currentUserFriends = user.friendsByEmail
                                }
                            }
                            authModel.isLoggedIn = true
                        }
                    }
                }
            }
        }
    }
}
