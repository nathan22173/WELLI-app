//
//  finishView.swift
//  WELLI
//
//  Created by Nathan Albe on 1/14/23.
//
import Firebase
import SwiftUI


//This view asks the user whether they have finished either the intervention or breathing and takes them to the next view
struct finishView : View{
    @State var showD = false
    @State var showyes = false
    @State var showno = false
    var body: some View{
        VStack {
            if showD == false {
                Text("Did You Finish Your Intervention?")
                    .padding()
            }
            if showyes {
                betterView()
                        } else {
                            Button(action: {
                                let ref = Database.database().reference()
                                let finishStatusfinal = ["finish_status": "Yes"]
                                ref.child("user").updateChildValues(finishStatusfinal)
                                showyes = true
                                showD = true
                            }) {
                                Text("Yes")
                               .foregroundColor(.green)
                               .bold()
                            }
                        }
            
            if showno {
                ContentView()
                        } else {
                            Button(action: {
                                let ref = Database.database().reference()
                                let finishStatusfinal = ["finish_status": "No"]
                                ref.child("user").updateChildValues(finishStatusfinal)
                                showno = true
                                showD = true
                            }) {
                                Text("No")
                               .foregroundColor(.red)
                               .bold()
                            }
                        }
        }.navigationBarBackButtonHidden(true)
    }
}

