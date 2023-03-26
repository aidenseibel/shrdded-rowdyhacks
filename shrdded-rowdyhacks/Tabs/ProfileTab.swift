//
//  ProfileView.swift
//  shrdded-rowdyhacks
//
//  Created by Aiden Seibel on 3/25/23.
//

import SwiftUI

struct ProfileTab: View {
    @State var accountName: String
    @State var accountBio: String
    @State var dateJoined: Date
    @State var allLifts: [lift]
    @State var personalRecords: [lift]
    
    @State var currentDate = Date.now
    var separationBetweenLazyHStackElements: Double = 0.25
    var colorOfElementsInLazyHStack: String = "darkergreen"
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    
                    //MARK: LAZY HSTACK
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(alignment: .top, spacing: 20){
                            VStack(alignment: .center){
                                Text("150")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .bold()
                                Text("weight")
                                    .foregroundColor(.white)
                            }
                            .frame(width: UIScreen.main.bounds.width * separationBetweenLazyHStackElements, height: UIScreen.main.bounds.width * separationBetweenLazyHStackElements * 0.7)                                .background(Color(colorOfElementsInLazyHStack))
                                .cornerRadius(10)

                            VStack(alignment: .center){
                                Text("\(String(format: "%.0f", (currentDate.distance(to: dateJoined)) / -86400))")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .bold()
                                Text("days on app")
                                    .font(.custom("System", size: 14))
                                    .foregroundColor(.white)

                            }
                            .frame(width: UIScreen.main.bounds.width * separationBetweenLazyHStackElements, height: UIScreen.main.bounds.width * separationBetweenLazyHStackElements * 0.7)                                .background(Color(colorOfElementsInLazyHStack))
                                .cornerRadius(10)
                            
                            ForEach(personalRecords, id: \.self) { pr in
                                VStack(alignment: .center){
                                    Text("\(pr.amount)")
                                        .font(.title)
                                        .foregroundColor(.white)
                                        .bold()
                                    Text("\(pr.type)")
                                        .foregroundColor(.white)
                                }
                                .frame(width: UIScreen.main.bounds.width * separationBetweenLazyHStackElements, height: UIScreen.main.bounds.width * separationBetweenLazyHStackElements * 0.7)
                                .background(Color(colorOfElementsInLazyHStack))
                                .cornerRadius(10)
                            }

                        }
                    }
                    .padding(15)
                    .background(Color("darkgreen"))
                    .cornerRadius(10)
                    
                    // MARK: PROFILE DESCRIPTION
                    Text("bio")
                        .font(.title)
                        .bold()
                        .padding(EdgeInsets(top: 20, leading: 5, bottom: 1, trailing: 5))
                    Text("\(accountBio)")
                        .padding(5)

                    
                    //MARK: GRAPHS
                    Text("progress")
                        .font(.title)
                        .bold()
                        .padding(EdgeInsets(top: 20, leading: 5, bottom: 5, trailing: 5))
                    VStack{
                        Text("Insert charts here")
                    }
                    .padding(15)
                    .background(.gray)
                    .cornerRadius(10)
                    
                    
                    //MARK: LIFTS
                    Text("recent lifts")
                        .font(.title)
                        .bold()
                        .padding(EdgeInsets(top: 20, leading: 5, bottom: 5, trailing: 5))
                    VStack{
                        ForEach(allLifts) { lift in
                            NavigationLink(destination: LiftPostSubView(accountName: accountName, lift: lift)){
                                VStack(alignment: .leading, spacing: 10){
                                    HStack{
                                        Text("\(getTimeSinceNow(from: lift.dateCreated))")
                                            .foregroundColor(Color("darkgrey"))
                                            .font(.custom("System", size: 14))
                                        Spacer()
                                    }
                                    if lift.isPersonalRecord{
                                        Text("Personal Record!")
                                            .font(.custom("System", size: 14))
                                            .padding(3)
                                            .background(Color("darkgreen"))
                                            .cornerRadius(3)
                                            .foregroundColor(.white)
                                    }
                                    HStack(alignment: .bottom){
                                        Text("\(lift.amount)")
                                            .font(.custom("System", size: 36))
                                            .bold()
                                        Text("\(lift.type)")
                                            .font(.custom("System", size: 24))
                                            .padding(.bottom, 3)
                                    }
                                }.padding()
                                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1))
                            }.buttonStyle(.plain)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("\(accountName)")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileTab(accountName: "accountName", accountBio: "fake bio", dateJoined: Date(timeIntervalSinceNow: -200000), allLifts: sampleLifts, personalRecords: sampleLifts)
    }
}
