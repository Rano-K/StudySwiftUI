//
//  _3_TODO_APP_withUIKitApp.swift
//  23_TODO_APP_withUIKit
//
//  Created by ms k on 7/23/24.
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
