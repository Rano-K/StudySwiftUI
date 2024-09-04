//
//  ContentView.swift
//  9(5)_Transition
//
//  Created by ms k on 4/23/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var show = false
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 300, height: 300)
                .foregroundStyle(.green)
                .overlay(
                    Text("Show Details")
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                        .foregroundStyle(.white)
                )
                .onTapGesture {
                    withAnimation(Animation.spring()){
                        self.show.toggle()
                    }
                }
            
            if show{
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 300, height: 300)
                    .foregroundStyle(.purple)
                    .overlay(
                        Text("Well, here is the details")
                            .font(.system(.largeTitle, design: .rounded))
                            .bold()
                            .foregroundStyle(.white)
                    )
//                    .transition(.offsetScaleOpacity)
//                    .transition(.asymmetric(insertion: .scale(scale: 0, anchor: .bottom), removal: .offset(x: -600, y: 0)))
                    .transition(.scaleAndOffset)
                    
            }
            
            
        }
        
    }
}
// 대칭전환
extension AnyTransition{
    static var offsetScaleOpacity : AnyTransition{
        AnyTransition.offset(x: -600, y: 0).combined(with: .scale).combined(with: .opacity)
    }
}

//비대칭 전환
extension AnyTransition{
    static var scaleAndOffset : AnyTransition {
        AnyTransition.asymmetric(
            insertion: .scale(scale: 0, anchor: .top).combined(with: .opacity),
            removal: .offset(x: -600, y: 00))
    }
}
