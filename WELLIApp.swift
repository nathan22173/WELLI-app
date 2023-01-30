//
//  WELLIApp.swift
//  WELLI Watch App
//
//  Created by Nathan Albe on 1/13/23.
//

import SwiftUI
import Firebase

@main
struct WELLI_Watch_AppApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
