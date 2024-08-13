//
//  ContentView.swift
//  9_BasicAnimation_Transitions
//
//  Created by ms k on 4/22/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var circleColorChanged = false
    @State private var heartColorChanged = false
    @State private var heartSizeChanged = false
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 200, height: 200)
                .foregroundStyle(circleColorChanged ? Color(.systemGray5) : .red)
                .animation(.easeInOut, value: circleColorChanged)
            
            Image (systemName: "heart.fill")
                .foregroundColor(heartColorChanged ? .red : .white)
                .font(.system(size: 100))
                .scaleEffect(heartSizeChanged ? 1.0 : 0.5)
                // heart 가 spring느낌으로 또이용 함
                .animation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3), value: [heartColorChanged, heartSizeChanged])
                .animation(.easeIn, value: [heartColorChanged, heartSizeChanged])
            
            
        }
        .padding()
        .onTapGesture {
            self.circleColorChanged.toggle()
            self.heartColorChanged.toggle()
            self.heartSizeChanged.toggle()
        }
    }
}

