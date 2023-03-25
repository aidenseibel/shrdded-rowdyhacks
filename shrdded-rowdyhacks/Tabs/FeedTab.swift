//
//  ContentView.swift
//  shrdded-rowdyhacks
//
//  Created by Aiden Seibel on 3/25/23.
//

import SwiftUI

struct FeedTab: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(sampleLifts, id: \.self){ lift in
                        LiftPostSubView(lift: lift)

                    }.overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1))
                    
                    
                }
                .padding()
            }
            .navigationTitle(feedTabHeaders.randomElement() ?? "Have a great day")
            .navigationBarTitleDisplayMode(.large)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FeedTab()
    }
}

var feedTabHeaders: [String] = [
    "Feel the burn",
    "It's a great day to lift",
    "Time for a PR"
]
