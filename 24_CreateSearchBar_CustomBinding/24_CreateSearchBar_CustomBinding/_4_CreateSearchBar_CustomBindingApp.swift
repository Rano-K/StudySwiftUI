//
//  _4_CreateSearchBar_CustomBindingApp.swift
//  24_CreateSearchBar_CustomBinding
//
//  Created by ms k on 7/25/24.
//

import SwiftUI


@main
struct _4_CreateSearchBar_CustomBindingApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ToDoItem.self)
    }
}
