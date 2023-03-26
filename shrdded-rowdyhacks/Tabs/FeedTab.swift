//
//  ContentView.swift
//  shrdded-rowdyhacks
//
//  Created by Aiden Seibel on 3/25/23.
//

import SwiftUI

struct FeedTab: View {
    @State var accountName: String
    @EnvironmentObject var dataManager: DataManager
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(dataManager.lifts, id: \.self){ lift in
                        LiftPostSubView(lift: lift)
                    }.overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1))
                }
                .padding()
            }
            .navigationTitle(feedTabHeaders.randomElement() ?? "have a great day")
            .navigationBarTitleDisplayMode(.large)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        AddLiftView(accountName: accountName)
                    } label: {
                        Text("add lift")
                            .font(.custom("System", size: 14))
                            .padding(10)
                            .background(Color("darkgreen"))
                            .cornerRadius(3)
                            .foregroundColor(.white)
                    }.buttonStyle(.plain)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FeedTab(accountName: "accountName")
    }
}

var feedTabHeaders: [String] = [
    "feel the burn",
    "it's a great day to lift",
    "gym time!",
    "time for a PR"
]
