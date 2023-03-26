//
//  FinalizeAccountCreation.swift
//  shrdded-rowdyhacks
//
//  Created by Aiden Seibel on 3/26/23.
//

import SwiftUI

struct FinalizeAccountCreation: View {
    @EnvironmentObject var dataManager: DataManager
    @EnvironmentObject var authModel: AuthModel

    @State var usernameText: String = ""
    @State var bioText: String = ""
    @Binding var email: String

    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        VStack{
            ScrollView{
                VStack{
                    Text("just two more things")
                        .font(.largeTitle)
                        .bold()

                    Text("username")
                        .font(.title)
                        .bold()
                        .padding(EdgeInsets(top: 20, leading: 0, bottom: 1, trailing: 5))
                    
                    TextField("enter a username", text: $usernameText)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(.gray, lineWidth: 2))

                    Text("bio?")
                        .font(.title)
                        .bold()
                        .padding(EdgeInsets(top: 20, leading: 0, bottom: 1, trailing: 5))
                    
                    TextField("add a bio", text: $bioText)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(.gray, lineWidth: 2))
                }
            }.padding()
            
            Button {
                dataManager.addUser(id: UUID(), email: email, username: usernameText, bio: bioText)
                authModel.needsUserNameAndBio = false
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("create account")
                    .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.width * 0.15)
                    .foregroundColor(.white)
                    .bold()
                    .background(Color("darkgreen"))
                    .cornerRadius(10)
            }
            .padding()

        }
    }
}

struct FinalizeAccountCreation_Previews: PreviewProvider {
    static var previews: some View {
        FinalizeAccountCreation(email: .constant("a"))
    }
}
