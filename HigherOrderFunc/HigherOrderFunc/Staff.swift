//
//  Staff.swift
//  HigherOrderFunc
//
//  Created by ms k on 8/16/24.
//

import Foundation

//ContainsView에 적용될 Staff클래스
class Staff{
    enum Gender {
    case male, female
    }
    
    var name : String
    var gender : Gender
    var age : Int
    
    init(name: String, gender: Gender, age: Int) {
        self.name = name
        self.gender = gender
        self.age = age
    }
}

let staff = [
    Staff(name: "Nick", gender: .male, age: 37),
    Staff(name: "Julia", gender: .female, age: 29),
    Staff(name: "Tom", gender: .male, age: 41),
    Staff(name: "Tony", gender: .male, age: 45),
    Staff(name: "Emily", gender: .female, age: 42),
    Staff(name: "Irene", gender: .female, age: 30)
]
