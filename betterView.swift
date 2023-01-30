//
//  betterView.swift
//  WELLI
//
//  Created by Nathan Albe on 1/14/23.
//

import SwiftUI
import Firebase

// This view asks whether you feel better and based on your answer takes you to the rewards or back to the main page
struct betterView : View{
    @State var showDe = false
    @State var showfinishyes = false
    @State var showfinishno = false
    var body: some View{
        VStack {
            if showDe == false {
                Text("Do You Feel Better?")
                    .padding()
            }
            if showfinishyes {
                rewardView()
            }
            else {
                            Button(action: {
                                let ref = Database.database().reference()
                                let finishStatusfinal = ["finish_status": "Yes"]
                                ref.child("user").updateChildValues(finishStatusfinal)
                                showfinishyes = true
                                showDe = true
                            }) {
                                Text("Yes")
                               .foregroundColor(.green)
                               .bold()
                            }
                        }
            
            
            if showfinishno {
                ContentView()
                        } else {
                            Button(action: {
                                let ref = Database.database().reference()
                                let finishStatusfinal = ["finish_status": "Yes"]
                                ref.child("user").updateChildValues(finishStatusfinal)
                                showfinishno = true
                                showDe = true
                            }) {
                                Text("No")
                               .foregroundColor(.red)
                               .bold()
                            }
                        }
            
        }.navigationBarBackButtonHidden(true)
    }
}

struct BetterView_Previews: PreviewProvider {
    static var previews: some View {
        betterView()
    }
}
