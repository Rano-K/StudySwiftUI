//
//  ContentView.swift
//  SwiftUIChapter3
//
//  Created by ms k on 4/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ScrollView{
            VStack {
//                Image(systemName: "cloud.heavyrain")
//                    .font(.system(size: 100))
//                    .foregroundColor(.blue)
//                    .shadow(color: .gray, radius: 10, x: 0, y: 10)
//                
//                Image("Paris")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
                
//                Image("Paris")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
////
//                Image("Paris")
//                    .resizable()
//                    .scaledToFill()
//                    .clipShape(Circle())
//                Image("Paris")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 300)
//                    .clipShape(Circle())
//                Image("Paris")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 300)
//                    .clipShape(Circle())
//                    .opacity(0.5)
//                    .overlay(
//                        Image(systemName: "heart.fill")
//                            .font(.system(size: 50))
//                            .foregroundColor(.black)
//                            .opacity(0.5)
//                )
//                Image("Paris")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .overlay(
//                        Text("If you are lucky enough to have lived in Paris as a young man, then wherever you go for the rest of your life it stays with you, for Paris is a moveable feast.\n\n- Ernest Hemingway")
//                            .fontWeight(.thin)
//                            .font(.system(.headline, design: .serif))
//                            .foregroundColor(.white)
//                            .padding()
//                            .background(Color.black)
//                            .cornerRadius(50)
//                            .opacity(0.5)
//                            .padding(),
//                        alignment: .center
//                        )
//                Image("Paris")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .overlay(
//                        Rectangle()
//                            .foregroundColor(.black)
//                            .opacity(0.5)
//                    )
//                Image("Paris")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .overlay(
//                        Color.black
//                            .opacity(0.4)
//                )
                
                Image("Paris")
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .overlay(
                        Color.black
                            .opacity(0.4)
                            .overlay(
                                Text("PARIS")
                                    .font(.largeTitle)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .foregroundStyle(.white)
                                    .frame(width: 31),
                                alignment: .center
                            )
                    )




            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
