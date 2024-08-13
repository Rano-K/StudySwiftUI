//
//  ContentView.swift
//  SwiftUIChapter7_(State, Binding)
//
//  Created by ms k on 4/20/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPlaying : Bool = false
    @State private var clickCountPlaying : Int = 0
    @State private var clickCountStop : Int = 0
    
    var body: some View {
        HStack {
            Button(action: {
                //재생버튼, 중지버튼을 전환하도록 함.
                self.isPlaying.toggle()
                isPlaying ? (clickCountStop += 1) : (clickCountPlaying += 1)
                print("\(isPlaying ? clickCountStop : clickCountPlaying)")
                
            }) {
                Image(systemName: isPlaying ? "stop.circle.fill" : "play.circle.fill")
                    .font(.system(size: 150))
                    .foregroundStyle(isPlaying ? .red : .green)
                VStack(spacing: 50){
                    Group{
                        Text("Playing : \(clickCountPlaying)")
                            .font(.caption)
                        Text("Stop : \(clickCountStop)")
                            .font(.title)
                    }
                    .padding(50)
                    .frame(width: 200, height: 200)
                    
                    .fontWeight(.black)
                    .background(.red)
                    .foregroundStyle(.white)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    
                }
                
            }
            
            
            
        }
        .padding()
    }
}


