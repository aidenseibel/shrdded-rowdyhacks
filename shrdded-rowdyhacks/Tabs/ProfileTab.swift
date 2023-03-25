//
//  ProfileView.swift
//  shrdded-rowdyhacks
//
//  Created by Aiden Seibel on 3/25/23.
//

import SwiftUI

struct ProfileTab: View {
    var profile: profile
    @State var currentDate = Date.now
    var separationBetweenLazyHStackElements: Double = 0.25
    var colorOfElementsInLazyHStack: String = "darkgrey"
    
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
                                Text("weight")                                    .foregroundColor(.white)
                            }
                            .frame(width: UIScreen.main.bounds.width * separationBetweenLazyHStackElements, height: UIScreen.main.bounds.width * separationBetweenLazyHStackElements * 0.7)                                .background(Color(colorOfElementsInLazyHStack))
                                .cornerRadius(10)

                            VStack(alignment: .center){
                                Text("\(String(format: "%.0f", (currentDate.distance(to: profile.dateJoined)) / -86400))")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .bold()
                                Text("days on app")
                                    .foregroundColor(.white)

                            }
                            .frame(width: UIScreen.main.bounds.width * separationBetweenLazyHStackElements, height: UIScreen.main.bounds.width * separationBetweenLazyHStackElements * 0.7)                                .background(Color(colorOfElementsInLazyHStack))
                                .cornerRadius(10)
                            
                            ForEach(getAllCurrentPersonalRecordsForAllTypes(account: profile)) { pr in
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
                    .background(.gray)
                    .cornerRadius(10)
                    
                    // MARK: PROFILE DESCRIPTION
                    Text("bio")
                        .font(.title)
                        .bold()
                        .padding(EdgeInsets(top: 20, leading: 5, bottom: 1, trailing: 5))
                    Text("\(profile.bio)")
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
                        ForEach(profile.lifts) { lift in
                            LiftPostSubView(profile: profile, lift: lift)
                        }
                    }
                    .padding(15)
                    .background(.gray)
                    .cornerRadius(10)

                    
                }
                .padding()
            }
            .navigationTitle("\(profile.username)")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileTab(profile: sampleProfiles[0])
    }
}
