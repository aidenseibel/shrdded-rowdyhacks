//
//  PostView.swift
//  shrdded-rowdyhacks
//
//  Created by Aiden Seibel on 3/25/23.
//

import SwiftUI

struct LiftPostSubView: View {
    
    var lift: lift
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            HStack{
                Text("\(lift.account.username)")
                    .font(.title2)
                    .bold()
                Text("posted a new lift")
                    .font(.title2)
                    .foregroundColor(Color("darkgrey"))
                Spacer()
                Text("yesterday")
                    .foregroundColor(Color("darkgrey"))

            }
            Text("Personal Record!")
                .padding(3)
                .background(Color("darkgreen"))
                .cornerRadius(3)
                .foregroundColor(.white)
            
            HStack(alignment: .bottom){
                Text("225")
                    .font(.custom("System", size: 48))
                Text("squat")
                    .font(.custom("System", size: 36))
                    .padding(.bottom, 3)
            }
            
            Text("Finally!")
                
        }.padding()
    }
}

struct LiftPostSubView_Previews: PreviewProvider {
    static var previews: some View {
        LiftPostSubView(lift: sampleLifts[0])
            .previewLayout(.sizeThatFits)
    }
}
