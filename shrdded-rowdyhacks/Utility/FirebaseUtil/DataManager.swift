//
//  DataManager.swift
//  shrdded-rowdyhacks
//
//  Created by Aiden Seibel on 3/26/23.
//

import Foundation
import Firebase

class DataManager: ObservableObject{
    @Published var lifts: [lift] = []
    @Published var users: [user] = []
    
    init(){
        fetchLifts()
        fetchUsers()
    }
    
    func fetchLifts(){
        lifts.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Lifts")
        ref.getDocuments { snapshot, error in
            guard error == nil else{
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot{
                for document in snapshot.documents{
                    let data = document.data()
                    

                    let type = data["type"] as? String ?? ""
                    let amount = data["amount"] as? Int ?? 0
                    let userEmail = data["userEmail"] as? String ?? ""
                    let description = data["description"] as? String ?? ""
                    
                    let lift = lift(userEmail: userEmail, type: type, amount: amount, dateCreated: Date(), description: description)
                    self.lifts.append(lift)
                }
            }
        }
    }
    
    func addLift(id: UUID, type: String, amount: Int, description: String, userEmail: String){
        let db = Firestore.firestore()
        let ref = db.collection("Lifts").document(id.uuidString)
        ref.setData(["type" : type, "amount": amount, "description": description, "userEmail": userEmail]){ error in
            if let error = error{
                print(error.localizedDescription)
            }
            
        }
    }
    
    func fetchUsers(){
        lifts.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Users")
        ref.getDocuments { snapshot, error in
            guard error == nil else{
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot{
                for document in snapshot.documents{
                    let data = document.data()
                    
                    let email = data["email"] as? String ?? ""
                    let username = data["username"] as? String ?? ""
                    let bio = data["bio"] as? String ?? ""
                    
                    let user = user(username: username, email: email, bio: bio, dateJoined: Date())
                    self.users.append(user)
                }
            }
        }
    }
    
    
    func addUser(id: UUID, email: String, username: String, bio: String){
        let db = Firestore.firestore()
        let ref = db.collection("Users").document(id.uuidString)
        ref.setData(["email" : email, "username": username, "bio": bio]){ error in
            if let error = error{
                print(error.localizedDescription)
            }
        }
    }
    
//    func getUserInfo(forUserID: String, handler: @escaping (_ name: String?, _ bio: String?, _ email: String?) -> ()) {
//        let db = Firestore.firestore()
//        let ref = db.collection("Users")
//
//        ref.document(forUserID).getDocument { (documentSnapshot, error) in
//            if let document = documentSnapshot,
//               let name = document.get("username") as? String,
//               let email = document.get("email") as? String,
//               let bio = document.get("bio") as? String {
//                print("Success getting user info")
//                handler(name, email, bio)
//                return
//            } else {
//                print("Error getting user info")
//                handler(nil, nil, nil)
//                return
//            }
//        }
//    }
}
