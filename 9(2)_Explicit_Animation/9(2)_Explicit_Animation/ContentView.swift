//
//  ContentView.swift
//  9(2)_Explicit_Animation
//
//  Created by ms k on 4/22/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var circleColorChanged : Bool = false
    @State private var heartColorChanged : Bool = false
    @State private var heartSizeChanged : Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 200, height: 200)
                .foregroundStyle(circleColorChanged ? Color(.systemGray5) : .red)
            
            Image(systemName: "heart.fill")
                .foregroundStyle(heartColorChanged ? .red : .white)
                .font(.system(size: 100))
                .scaleEffect(heartSizeChanged ? 1.0 : 0.5)
            
        }
        .padding()
        .onTapGesture {
//            withAnimation(.default){
            withAnimation(.spring(response: 1, dampingFraction: 0.3, blendDuration: 0.3)){
                self.circleColorChanged.toggle()
                self.heartColorChanged.toggle()
                self.heartSizeChanged.toggle()
            }
        }
    }
}

