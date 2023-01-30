//
//  deepBreathingView.swift
//  WELLI
//
//  Created by Nathan Albe on 1/14/23.
//
import Firebase
import SwiftUI
import UIKit
import SDWebImageSwiftUI

struct deepBreathingView : View{
    @State var num = 0.0
    @State var scale = 1.0
    @State var show = false
    var body: some View{
        VStack{
            if show == false {
                Text("Take a Deep Breath. Click finish when you are done.")
                    .padding()
                    .frame(width:200, height: 100)
                Image(uiImage: UIImage(named:"breathing.png")!)
                    .frame(width: 95, height: 15)
                    .scaleEffect(scale)
                    .onAppear {
                        let baseAnimation = Animation.easeInOut(duration: 5)
                        let repeated = baseAnimation.repeatForever(autoreverses: true)
                        
                        withAnimation(repeated) {
                            scale = 0.5
                        }
                    }
            }
            if show {
                 finishView()
                        } else {
                            Button(action: {
                                let ref = Database.database().reference()
                                let interventionFinal = ["intervention": "Breath"]
                                ref.child("user").updateChildValues(interventionFinal)
                                self.show = true
                            }) {
                                Text("Finished")
                               .bold()

                            //start of animation
                                .opacity(num)
                                .onAppear
                            {
                                let delay = Animation.easeIn(duration: 1).delay(5)
                                
                                withAnimation(delay)
                                {
                                    num += 1
                                }
                            }
                            }
                        }
        }
        }
    }

    

