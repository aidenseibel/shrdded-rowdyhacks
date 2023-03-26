//
//  ShowSearchResults.swift
//  shrdded-rowdyhacks
//
//  Created by Aiden Seibel on 3/26/23.
//

import SwiftUI

struct ShowSearchResults: View {
    @Binding var searchString: String
    @EnvironmentObject var dataManager: DataManager
    @EnvironmentObject var authModel: AuthModel
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                ForEach(dataManager.users){ user in
                    if user.username == searchString{
                        HStack{
                            Text("\(user.username)")
                                .font(.title2)
                                .padding()
                            Spacer()
                            Button {
                                authModel.currentUserFriends.append(user.email)
                                dataManager.updateUserFriends(userID: authModel.currentUserUserID, friends: authModel.currentUserFriends) { success in
                                    if success == true{
                                        print("success")
                                    }else{
                                        print("unsuccessful")
                                    }
                                }
                            } label: {
                                Text("Add friend")
                            }
                        }
                    }
                }
            }
            .padding(EdgeInsets(top: 100, leading: 10, bottom: 10, trailing: 10))
        }
    }
}

struct ShowSearchResults_Previews: PreviewProvider {
    static var previews: some View {
        ShowSearchResults(searchString: .constant("aseibel1"))
    }
}
