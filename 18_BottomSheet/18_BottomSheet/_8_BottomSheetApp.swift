//
//  _8_BottomSheetApp.swift
//  18_BottomSheet
//
//  Created by ms k on 6/20/24.
//

import SwiftUI

@main
struct _8_BottomSheetApp: App {
    var body: some Scene {
        WindowGroup {
            TabView{
                ContentView()
                    .onAppear(perform: {
                        UIApplication.shared.addTabGestureRecognizer()
                    })
                    .tabItem {
                        Text("1")
                    }
                    
                
            }
            
        }
    }
}
