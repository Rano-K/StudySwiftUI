//
//  _0_ActivityRing_Shape_Animatable_App.swift
//  30_ActivityRing(Shape,Animatable)
//
//  Created by ms k on 12/19/24.
//

import SwiftUI

@main
struct _0_ActivityRing_Shape_Animatable_App: App {
    
    @State var progress : Double = 0.9
    
    var body: some Scene {
        WindowGroup {
            TabView{
                ContentView(progress: progress)
                    .tabItem({
                        Text("ContentView")
                    })
            }
        }
    }
}
