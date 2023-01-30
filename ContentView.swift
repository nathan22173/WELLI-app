//
//  ContentView.swift
//  WELLI Watch App
//
//  Created by Nathan Albe on 1/13/23.
//
import Foundation
import SwiftUI
import Firebase
struct ContentView: View {
    
    @StateObject
    var viewModel = WriteViewModel()
    
    @State
    var content: String = ""
    
    @State var showDetail = false
    
    var imageNames: [String] = ["frame 1", "frame 2"]
    
    var body: some View {
        NavigationView
        {
            VStack {
                if showDetail == false {
                    Text("How do you feel?")
                        .padding()
                }
                if showDetail {
                    deepBreathingView()
                } else {
                    Button(action: {
                        let ref = Database.database().reference()
                        let start = ["st_mood": "Good"]
                        let name = ["name": ""]
                        ref.child("user").setValue(name)
                        ref.child("user").updateChildValues(start)
                        
                        showDetail = true
                    }) {
                        Text("Good")
                            .foregroundColor(.green)
                            .bold()
                    }
                }
                //NavigationLink(destination: deepBreathingView(), label:{ Text("Okay")
                //.foregroundColor(.blue)
                // .bold()
                // })
                
                //NavigationLink(destination: interventionView(), label:{ Text("I Need Help")
                //.foregroundColor(.red)
                //.bold()
                //})
            }
        }.navigationBarBackButtonHidden(true)
    }
}
            
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
