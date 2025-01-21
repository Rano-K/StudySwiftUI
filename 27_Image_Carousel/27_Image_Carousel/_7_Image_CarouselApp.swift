//
//  _7_Image_CarouselApp.swift
//  27_Image_Carousel
//
//  Created by ms k on 11/20/24.
//

import SwiftUI

@main
struct _7_Image_CarouselApp: App {
    var body: some Scene {
        WindowGroup {
            TabView{
                ContentView()
                    .tabItem({
                        Text("Main")
                    })
                GestureTestView()
                    .tabItem({
                        Text("Gesture Test")
                    })
                TripDetailView(destination: "Florence")
                    .tabItem({
                        Text("DetailView")
                    })
            }
            
        }
    }
}
