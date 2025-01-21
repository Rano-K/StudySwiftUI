//
//  _9_PhotoGridApp.swift
//  29_PhotoGrid
//
//  Created by ms k on 12/16/24.
//

import SwiftUI

@main
struct _9_PhotoGridApp: App {
    
    var body: some Scene {
        WindowGroup {
            TabView{
                ContentView()
                    .tabItem { Text("Main") }
                MultiGridView()
                    .tabItem { Text("MultiGridView")}
            }
            
        }
    }
}
