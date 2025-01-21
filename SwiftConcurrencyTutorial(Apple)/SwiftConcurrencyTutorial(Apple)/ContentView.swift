//
//  ContentView.swift
//  SwiftConcurrencyTutorial(Apple)
//
//  Created by ms k on 11/13/24.
//

import SwiftUI

struct ContentView: View {
        
    let test1 = Person(name: "ms", age : 30)
    let test2 = Person(name: "clone", age: 30)

    var body: some View {
        VStack {
            
            if test1 == test2{
                Text("true")
            }
            if test1 <= test2 {
                Text("test2")
            }
            if test1 < test2{
                Text("test3")
            }
            
        }
        .padding()
    }
}

