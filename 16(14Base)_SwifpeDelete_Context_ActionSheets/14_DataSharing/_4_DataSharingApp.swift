//
//  _4_DataSharingApp.swift
//  14_DataSharing
//
//  Created by ms k on 5/7/24.
//

import SwiftUI

@main
struct _4_DataSharingApp: App {
    var settingStore = SettingDataStore()
    var body: some Scene {
        WindowGroup {
            TabView{
//                ContentView(settingStore: SettingDataStore())
                ContentView().environmentObject(self.settingStore)
                    .tabItem {
                        Image(systemName: "1.square.fill")
                    }
//                propertyTest()
//                    .tabItem {
//                        Image(systemName: "2.square.fill")
//                    }
                    
            }
        }
    }
}
