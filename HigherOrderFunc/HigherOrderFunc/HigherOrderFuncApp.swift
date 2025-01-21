//
//  HigherOrderFuncApp.swift
//  HigherOrderFunc
//
//  Created by ms k on 8/2/24.
//

import SwiftUI

@main
struct HigherOrderFuncApp: App {
    var body: some Scene {
        WindowGroup {
            TabView{
                ContentView()
                    .tabItem {
                        Text("Map")
                    }
                
                Map_Dictionaries()
                    .tabItem {
                        Text("Map_Dictionaries")
                    }
                
                MapValues()
                    .tabItem{
                        Text("MapValues")
                    }
                
                CompactMap()
                    .tabItem {
                        Text("CompactMap")
                    }
                Filter()
                    .tabItem {
                        Text("Filter")
                    }
                
                Reduce()
                    .tabItem {
                        Text("Reduce")
                    }
                
                ForEachView()
                    .tabItem{
                        Text("ForEach")
                    }
                
                ContainsView()
                    .tabItem {
                        Text("ContainsView")
                    }
                
                RemoveAllView()
                    .tabItem {
                        Text("RemoveAll")
                    }
                
                SortedView()
                    .tabItem {
                        Text("Sorted")
                    }
                
                SplitView()
                    .tabItem {
                        Text("Split")
                    }
            }
            
        }
    }
}
