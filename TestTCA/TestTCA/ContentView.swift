//
//  ContentView.swift
//  TestTCA
//
//  Created by ms k on 8/14/24.
//

import SwiftUI
import TCAPackage
import ComposableArchitecture

struct CounterEnvironment : Equatable{}

enum CounterAction{
    case add
    case sub
}

struct CounterState : Equatable{
    var count = 0
}

let countReducer = AnyRducer<CounterState, CounterAction

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

