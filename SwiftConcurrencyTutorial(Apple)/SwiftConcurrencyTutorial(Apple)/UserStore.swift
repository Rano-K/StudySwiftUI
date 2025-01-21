//
//  UserStore.swift
//  SwiftConcurrencyTutorial(Apple)
//
//  Created by ms k on 11/14/24.
//

import SwiftUI
 
struct Person : Comparable {
    static func < (lhs: Person, rhs: Person) -> Bool {
        return lhs.age < rhs.age
    }
    
    var name = ""
    var age = 0
}

