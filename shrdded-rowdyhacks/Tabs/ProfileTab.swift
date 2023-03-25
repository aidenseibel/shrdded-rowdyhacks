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
                                    .bold()
                                Text("weight")
                            }.frame(width: UIScreen.main.bounds.width * separationBetweenLazyHStackElements)
                            VStack(alignment: .center){
                                Text("\(String(format: "%.0f", (currentDate.distance(to: profile.dateJoined)) / -86400))")
                                    .font(.title)
                                    .bold()
                                Text("days on app")
                            }.frame(width: UIScreen.main.bounds.width * separationBetweenLazyHStackElements)
                            ForEach(profile.lifts, id: \.self) { lift in
                                if lift.isPersonalRecord{
                                    VStack(alignment: .center){
                                        Text("\(lift.amount)")
                                            .font(.title)
                                            .bold()
                                        Text("\(lift.type)")
                                    }.frame(width: UIScreen.main.bounds.width * separationBetweenLazyHStackElements)
                                }
                            }
                        }
                    }
                    
                    // MARK: PROFILE DESCRIPTION
                    Text("\(profile.bio)")

                    
                    //MARK: GRAPHS
                    
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
