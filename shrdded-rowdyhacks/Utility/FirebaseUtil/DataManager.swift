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
                    
                    let timestamp: Timestamp = document.get("dateCreated") as? Timestamp ?? Timestamp(date: Date.now)
                    
                    let date = timestamp.dateValue()
                    
                    let lift = lift(userEmail: userEmail, type: type, amount: amount, dateCreated: date, description: description)
                    self.lifts.append(lift)
                        
                    
                }
            }
        }
    }
    
    func addLift(id: UUID, type: String, amount: Int, description: String, userEmail: String){
        let db = Firestore.firestore()
        let ref = db.collection("Lifts").document(id.uuidString)
        ref.setData(["type" : type, "amount": amount, "description": description, "userEmail": userEmail, "dateCreated": FieldValue.serverTimestamp()]){ error in
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
                    let friends = data["friendsByEmail"] as? [String] ?? []
                    
                    let timestamp: Timestamp = document.get("dateJoined") as? Timestamp ?? Timestamp(date: Date.now)
                    
                    let date = timestamp.dateValue()
                    
                    let user = user(username: username, email: email, bio: bio, dateJoined: date, friendsByEmail: friends)
                    self.users.append(user)
                }
            }
        }
    }
    
    func addUser(id: UUID, email: String, username: String, bio: String){
        let db = Firestore.firestore()
        let ref = db.collection("Users").document(id.uuidString)
        ref.setData(["email" : email, "username": username, "bio": bio, "dateJoined": FieldValue.serverTimestamp(), "friendsByEmail": []]){ error in
            if let error = error{
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: UPDATE USER FUNCTIONS
    
    func updateUserFriends(userID: String, friends: [user], handler: @escaping (_ success: Bool) -> ()) {
        let data: [String:Any] = ["friendsByEmail": friends]
        let db = Firestore.firestore()

        db.collection("Users").document(userID).updateData(data) { (error) in
            if let error = error {
                print("Error updating friends. \(error)")
                handler(false)
                return
            } else {
                handler(true)
                return
            }
        }
    }

}
