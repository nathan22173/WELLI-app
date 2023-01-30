//
//  WriteViewModel.swift
//  WELLI
//
//  Created by Nathan Albe on 1/14/23.
//
import FirebaseDatabase
import Foundation
import FirebaseDatabaseSwift

class WriteViewModel: ObservableObject{
    
    private let ref = Database.database().reference()
    
    func pushGood(){
        var generateObject = ObjectDemo()
        generateObject.end_mood = "Feel Better"
        generateObject.end_time = "2021 - 11 - 22 20:25:40"
        generateObject.finish_status = "yes"
        generateObject.hr_after = "placeholder"
        generateObject.hr_before = "placeholder"
        generateObject.intervention = "Breath"
        generateObject.st_mood = "Good"
        generateObject.st_time = "2021 - 11 - 22 20:24:57"
        generateObject.user = "placeholder"
        
        ref.child("user").setValue(generateObject.toDictionary)
        
    }
}
