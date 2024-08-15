//
//  _0_List_ForEach_IdentifiableApp.swift
//  10_List_ForEach_Identifiable
//
//  Created by ms k on 4/23/24.
//

import SwiftUI

@main
struct _0_List_ForEach_IdentifiableApp: App {
    var body: some Scene {
        WindowGroup {
            TabView{
                ContentView()
                    .tabItem{
                        Text("1")
                    }
                restaurantView_useModel()
                    .tabItem {
                        Text("2")
                    }
                FullImageRow()
                    .tabItem{
                        Text("FullImageRow")
                    }
                FullImage_with_BasicImage()
                    .tabItem{
                        Text("Full&Basic")
                    }
            }
        }
    }
}
