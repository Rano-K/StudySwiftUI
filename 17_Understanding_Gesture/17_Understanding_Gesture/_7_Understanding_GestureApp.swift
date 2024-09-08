//
//  _7_Understanding_GestureApp.swift
//  17_Understanding_Gesture
//
//  Created by ms k on 6/16/24.
//

import SwiftUI

@main
struct _7_Understanding_GestureApp: App {
    var body: some Scene {
        WindowGroup {
            TabView{
                ContentView()
                    .tabItem({
                        Image(systemName: "1.square.fill")
                        Text("LongPress, DragGesture")
                    })
                CombineGesture()
                    .tabItem({
                        Image(systemName: "2.square.fill")
                        Text("Combine Gesture")
                    })
                Gesture_Enum()
                    .tabItem({
                        Image(systemName: "3.square.fill")
                        Text("Using Enum")
                    })
                UsingDragableView()
                    .tabItem({
                        Image(systemName: "4.square.fill")
                        Text("using Structure")
                    })
                
            }
            
        }
    }
}
