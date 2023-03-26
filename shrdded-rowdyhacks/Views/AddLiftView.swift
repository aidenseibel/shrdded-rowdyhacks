//
//  AddLiftView.swift
//  shrdded-rowdyhacks
//
//  Created by Aiden Seibel on 3/25/23.
//

import SwiftUI

struct AddLiftView: View {
    @State var accountName: String
    @EnvironmentObject var dataManager: DataManager
    @EnvironmentObject var authModel: AuthModel

    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let liftTypes: [String] = ["bench","squat","deadlift"]
    @State private var liftTypeSelected = "bench"
    @State private var amountLifted = ""
    @State private var description = ""
    
    @State private var weightIsValid = true
    @State private var captionIsAppropriate = true
        
    var body: some View {
        VStack{
            ScrollView{
                VStack(alignment: .leading) {
                    Text("select lift type")
                        .font(.title)
                        .bold()
                        .padding(EdgeInsets(top: 20, leading: 0, bottom: 1, trailing: 5))
                    Picker("select lift type", selection: $liftTypeSelected){
                        ForEach(liftTypes, id: \.self){
                            Text($0)
                        }
                    }
                    .padding(EdgeInsets(top: 6, leading: 10, bottom: 6, trailing: 10))
                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(.gray, lineWidth: 2))

                    
                    //MARK: AMOUNT
                    Text("how much did you lift?")
                        .font(.title)
                        .bold()
                        .padding(EdgeInsets(top: 20, leading: 0, bottom: 1, trailing: 5))
                    
                    TextField("0", text: $amountLifted)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(.gray, lineWidth: 2))

                    
                    if !weightIsValid{
                        Text("Enter a valid weight! (No decimals)")
                            .padding(3)
                            .background(Color("darkgreen"))
                            .cornerRadius(3)
                            .foregroundColor(.white)
                            .padding(.top, 10)
                    }

                    
                    //MARK: DESCRIPTION
                    Text("any comments?")
                        .font(.title)
                        .bold()
                        .padding(EdgeInsets(top: 20, leading: 0, bottom: 1, trailing: 5))
                    
                    TextField("add a caption", text: $description)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(.gray, lineWidth: 2))

                                        
                    if !captionIsAppropriate{
                        Text("Caption is inappropriate!")
                            .padding(3)
                            .background(Color("darkgreen"))
                            .cornerRadius(3)
                            .foregroundColor(.white)
                            .padding(.top, 10)
                    }
                    
                }.padding()
            }
            Button {
                if let amountToInt = Int(amountLifted){
                    if amountToInt > 0{
                        if checkIfTextIsAppropriate(input: description){
                            //MARK: ADD FUNCTION
                            dataManager.addLift(id: UUID(), type: liftTypeSelected, amount: amountToInt, description: description, userEmail: authModel.currentUserEmail)
                            self.presentationMode.wrappedValue.dismiss()
                        }else{
                            captionIsAppropriate = false
                        }
                    }else{
                        weightIsValid = false
                    }
                }else{
                    weightIsValid = false
                }
            } label: {
                Text("add lift")
                    .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.width * 0.15)
                    .foregroundColor(.white)
                    .bold()
                    .background(Color("darkgreen"))
                    .cornerRadius(10)
                
            }
            .buttonStyle(.plain)
            .padding(10)
            
        }
        .navigationTitle("add a lift")
            .navigationBarTitleDisplayMode(.large)

    }
}

struct AddLiftView_Previews: PreviewProvider {
    static var previews: some View {
        AddLiftView(accountName: "accountName")
    }
}
