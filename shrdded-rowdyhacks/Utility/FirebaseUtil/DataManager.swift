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
                    let isPersonalRecord = data["isPersonalRecord"] as? Bool ?? false
                    let description = data["description"] as? String ?? ""
                    
                    let lift = lift(userID: "", type: type, amount: amount, dateCreated: Date(), isPersonalRecord: isPersonalRecord)
                    self.lifts.append(lift)
                }
            }
        }
    }
    
    func addLift(id: UUID, type: String, amount: Int, description: String, isPersonalRecord: Bool){
        let db = Firestore.firestore()
        let ref = db.collection("Lifts").document(id.uuidString)
        ref.setData(["type" : type, "amount": amount, "description": description, "isPersonalRecord": isPersonalRecord]){ error in
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
}
