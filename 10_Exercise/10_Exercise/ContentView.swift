//
//  ContentView.swift
//  10_Exercise
//
//  Created by ms k on 4/25/24.
//

import SwiftUI

struct ContentView: View {
    
    var articles = [
        listViewModel(title: "The Comprehensive Guide to the State Management in iOS", author: "Alexey Naumov", rating: 4, excerpt: "There are many challenges in the software development, but there is one beast that tends to screw things up much more often than the others: the problem of app’s state management and data propagation.", image: "state-management"),
        listViewModel(title: "Using Swift Protocols to Manage App Configuration", author: "Gabriel Theodoropoulos", rating: 4, excerpt: "Hello and welcome to a new tutorial! One of the most common concepts met and used in Swift by all developers is protocols, and I don’t think there’s even one developer who doesn’t know about them.", image: "protocols"),
        listViewModel(title: "Drawing a Border with Rounded Corners", author: "Simon Ng", rating: 4, excerpt: "With SwiftUI, you can easily draw a border around a button or text (and it actually works for all views) using the border modifier.", image: "swiftui-button"),
        listViewModel(title: "Building a Simple Text Editing App", author: "Gabriel Theodoropoulos", rating: 5, excerpt: "Today we are going to focus on a commonly used family of controls which are vital to every application. Their primary purpose is to gather user input as well as to display certain message types to users. We are going to talk about text controls.", image: "macos-programming"),
        listViewModel(title: "Building a Flutter App with Complex UI", author: "Lawrence Tan", rating: 4, excerpt: "Hello there! Welcome to the second tutorial of our Flutter series. In the last tutorial, you learned the basics of building a Flutter app. So if you have not gone through it, please take a pit stop here, visit it first before proceeding with this tutorial.", image: "flutter-app")
    ]
    
    var body: some View {
        
        List(articles){ article in
            
            ListView(listModel : article)
            
        }
        
    }
}

struct ListView : View{
    
    var listModel : listViewModel
    
    var body: some View{
        VStack(spacing: 10){
            Image(listModel.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(listModel.title)
                .font(.system(.title, design: .rounded))
                .bold()
            Text(listModel.author)
                .font(.system(.caption, design: .monospaced))
            Text(String(repeating: "⭐️", count: Int(listModel.rating)))
            Text(listModel.excerpt)
        }
    }
}
