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
        VStack(alignment: .leading, spacing: 10){
            HStack{
                Text("\(lift.account.username)")
                    .font(.title2)
                    .bold()
                Text("posted a new lift")
                    .foregroundColor(Color("darkgrey"))
                Spacer()
                Text("yesterday")
                    .foregroundColor(Color("darkgrey"))
                    .font(.custom("System", size: 14))


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
            if (lift.description != nil){
                Text("\(lift.description ?? "")!")
            }
                
        }.padding()
    }
}

struct LiftPostSubView_Previews: PreviewProvider {
    static var previews: some View {
        LiftPostSubView(lift: sampleLifts[0])
            .previewLayout(.sizeThatFits)
    }
}
