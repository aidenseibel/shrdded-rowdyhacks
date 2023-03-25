//
//  AddLiftView.swift
//  shrdded-rowdyhacks
//
//  Created by Aiden Seibel on 3/25/23.
//

import SwiftUI

struct AddLiftView: View {
    @State var profile: profile
    
    let liftTypes: [String] = ["bench","squat","deadlift"]
    @State private var liftTypeSelected = "bench"
    @State private var amountLifted = ""
    @State private var description = ""
        
    var body: some View {
        VStack{
            ScrollView{
                VStack(alignment: .leading) {
                    Text("select lift type")
                        .font(.title)
                        .bold()
                        .padding(EdgeInsets(top: 20, leading: 5, bottom: 1, trailing: 5))
                    Picker("select lift type", selection: $liftTypeSelected){
                        ForEach(liftTypes, id: \.self){
                            Text($0)
                        }
                    }
                    
                    
                    //MARK: AMOUNT
                    Text("how much did you lift?")
                        .font(.title)
                        .bold()
                        .padding(EdgeInsets(top: 20, leading: 5, bottom: 1, trailing: 5))
                    
                    TextField("0", text: $amountLifted)
                    
                    
                    //MARK: DESCRIPTION
                    Text("any comments?")
                        .font(.title)
                        .bold()
                        .padding(EdgeInsets(top: 20, leading: 5, bottom: 1, trailing: 5))
                    
                    TextField("add a caption", text: $description)
                                        
                    
                    
                }.padding()
            }
            Button {
                
            } label: {
                Text("Add lift")
                
            }
            .padding(10)
            
        }
        .navigationTitle("add a lift")
            .navigationBarTitleDisplayMode(.large)

    }
}

struct AddLiftView_Previews: PreviewProvider {
    static var previews: some View {
        AddLiftView(profile: sampleProfiles[0])
    }
}
