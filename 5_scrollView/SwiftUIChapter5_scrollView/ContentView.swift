//
//  ContentView.swift
//  SwiftUIChapter5_scrollView
//
//  Created by ms k on 4/17/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading){
                HStack(){
                    Text("Your Reading")
                        .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
                }
            }
            .padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    Group{
                        CardView(image: "swiftui-button", category: "SwiftUI", heading: "Drawing a Border with Rounded Corners", author: "Rano")
                            
                        CardView(image: "macos-programming", category: "macOS", heading: "Building a Simple Editing App", author: "Gabriel Theodorpoulos")
                            
                        CardView(image: "flutter-app", category: "Flutter", heading: "Building a Complex Layout with Flutter", author: "Lawrence Tan")
                            
                        CardView(image: "natural-language-api", category: "iOS", heading: "What's Newin Natural Language API", author: "Sai Kambampati")
                            
                    }
                    .frame(width: 300)
                }
                .padding()
            }
        }
//        ScrollView(){
//            VStack{
//                CardView(image: "swiftui-button", category: "SwiftUI", heading: "Drawing a Border with Rounded Corners", author: "Rano")
//                    .frame(width: 300)
//                CardView(image: "macos-programming", category: "macOS", heading: "Building a Simple Editing App", author: "Gabriel Theodorpoulos")
//                    .frame(width: 300)
//                CardView(image: "flutter-app", category: "Flutter", heading: "Building a Complex Layout with Flutter", author: "Lawrence Tan")
//                    .frame(width: 300)
//                CardView(image: "natural-language-api", category: "iOS", heading: "What's Newin Natural Language API", author: "Sai Kambampati")
//                    .frame(width: 300)
//            }
//            .padding()
//        }
        Spacer()
    }
}

#Preview {
    ContentView()
}
