//
//  ContentView.swift
//  SwiftUIChapter4_Stack
//
//  Created by ms k on 4/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HeaderView()
            
            VStack{
                HStack{
                    Spacer()
                    PriceView(title: "Basic", price: "$19", textColor: .white, bgColor: .purple)
                    ZStack{
                        PriceView(title: "Pro", price: "$29", textColor: .black, bgColor: .gray.opacity(0.5))
                        Text("Best for designer")
                            .font(.system(.caption, design: .rounded))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundStyle(.white)
                            .padding(5)
                            .background(.yellow)
                            .offset(x: 0, y: 86)
                    }
                    Spacer()
                }
                
                HStack {
                    ZStack{
                        
                        PriceView(title: "Team", price: "$299", textColor: .white, bgColor: Color(red: 255/255, green: 100/255, blue: 100/255), icon: "wand.and.rays")
                            .padding()
                            .scaledToFill()
                        
                        Text("Perfect for teams with 20 members")
                            .font(.system(.caption, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .padding(5)
                            .background(.yellow)
                            .offset(x: 0, y: 86)
                    }
                }
                Spacer() // 최하단
            }
            
            
            
        }
        
    }
}

#Preview {
    ContentView()
}

struct HeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text("Choose")
                Text("Your Plan")
            }
            .font(.system(.largeTitle, design: .rounded))
            .fontWeight(.black)
            Spacer()
        }
        .padding()
    }
}

struct PriceView : View {
    
    var title : String
    var price : String
    var textColor : Color
    var bgColor : Color
    var icon : String?
    
    var body: some View {
         
            VStack{
                //옵셔널처리 방법 1
//                if let icon = icon{
//                    Image(systemName: icon)
//                        .font(.largeTitle)
//                        .foregroundStyle(textColor)
//                }
                //옵셔널처리 방법 2 이거보단 방법1(if let)을 쓰자.
//                if icon != nil{
//                    Image(systemName: icon!)
//                        .font(.largeTitle)
//                        .foregroundStyle(textColor)
//                }
                icon.map({
                    Image(systemName: $0)
                        .font(.largeTitle)
                        .foregroundStyle(textColor)
                })
                
                Text(title)
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.black)
                    .foregroundStyle(textColor)
                Text(price)
                    .font(.system(size: 40, weight: .heavy, design: .rounded))
                    .foregroundStyle(textColor)
                    .fontWeight(.black)
               Text("per month")
                    .font(.headline)
                    .foregroundStyle(textColor)
            }
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: 100)
            .padding(40)
            .background(bgColor)
            .cornerRadius(10)
    }
}
