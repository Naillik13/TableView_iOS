//
//  Person.swift
//  PersonMgr
//
//  Created by killian galea on 24/10/2018.
//  Copyright © 2018 killiangalea. All rights reserved.
//

import UIKit

class Person: NSObject {
    var firstName: String
    var lastName: String
    var birthYear: Int
    var nationality:String
    var gender: String
    
    init(firstName: String, lastName: String){
        self.firstName = firstName
        self.lastName = lastName
        self.birthYear = Int.random(in: 1950 ..< 2018)
        
        func getGender() -> String{
            let genderBool = Bool.random()
            var genderString = "Male"
            if genderBool {
                genderString = "Female"
            }
            return genderString
        }
        
        self.gender = getGender()
        
        func getNationality() -> String{
            let nationalityInt = Int.random(in: 0 ..< 4)
            var nationalityString = "French"
            if nationalityInt == 1 {
                nationalityString = "English"
            } else if nationalityInt == 2 {
                nationalityString = "German"
            } else if nationalityInt == 2 {
                nationalityString = "Spanish"
            }
            return nationalityString
        }
        
        self.nationality = getNationality()
        
        
    }
    
    
}
