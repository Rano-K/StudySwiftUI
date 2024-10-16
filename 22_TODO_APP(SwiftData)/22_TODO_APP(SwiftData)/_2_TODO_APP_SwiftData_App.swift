//
//  _2_TODO_APP_SwiftData_App.swift
//  22_TODO_APP(SwiftData)
//
//  Created by ms k on 7/16/24.
//

import SwiftUI

@main
struct _2_TODO_APP_SwiftData_App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ToDoItem.self)
    }
}
