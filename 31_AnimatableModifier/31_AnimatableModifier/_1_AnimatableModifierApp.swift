//
//  _1_AnimatableModifierApp.swift
//  31_AnimatableModifier
//
//  Created by ms k on 1/3/25.
//

import SwiftUI

@main
struct _1_AnimatableModifierApp: App {
    var body: some Scene {
        WindowGroup {
            TabView{
                
                DailyTaskView()
                    .tabItem{
                        Text("Task")
                    }
                
                ContentView()
                    .tabItem{
                        Text("ContentView")
                    }
            }
        }
    }
}
