//
//  ShowSearchResults.swift
//  shrdded-rowdyhacks
//
//  Created by Aiden Seibel on 3/26/23.
//

import SwiftUI

struct ShowSearchResults: View {
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                Text("hello world")
            }
            .padding(EdgeInsets(top: 100, leading: 10, bottom: 10, trailing: 10))
        }
    }
}

struct ShowSearchResults_Previews: PreviewProvider {
    static var previews: some View {
        ShowSearchResults()
    }
}
