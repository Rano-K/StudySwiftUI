//
//  _3_Picker_ToggleApp.swift
//  13_Picker_Toggle
//
//  Created by ms k on 5/1/24.
//

import SwiftUI

@main
struct _3_Picker_ToggleApp: App {
    var body: some Scene {
        WindowGroup {
            TabView{
                SettingView()
                    .tabItem{
                        Image(systemName: "gear")
                        Text("SettingView")
                    }
                SettingViewTest()
                    .tabItem{
                        Image(systemName: "x.circle")
                        Text("TestView")
                    }
                SettingViewTest2()
                    .tabItem{
                        VStack{
                            Text("List vs Form")
                        }
                        
                    }
                //Restaurant View
                ContentView()
                    .tabItem{
                        Image(systemName: "fork.knife")
                        Text("RestaurantView")
                    }
                
            }
        }
    }
}
