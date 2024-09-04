//
//  ContentView.swift
//  9(3)_RotationEffect_LoadingIndicator
//
//  Created by ms k on 4/22/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isLoading = false
    @State private var progress : CGFloat = 0.0
    
    var body: some View {
        ScrollView{
            VStack {
                Spacer()
                Circle()
                    .trim(from: 0, to: 0.7)
                    .stroke(Color.green, lineWidth: 5)
                    .frame(width: 100, height: 100)
                    .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                    .animation(Animation.linear(duration: 0.5).repeatForever(autoreverses: false), value: isLoading)
                    .onAppear() {
                        self.isLoading = true
                    }
                
                Spacer()
                
                
                ZStack{
                    Circle()
                        .stroke(Color(.systemGray5), lineWidth: 14)
                        .frame(width: 100, height: 100)
                    
                    Circle()
                        .trim(from: 0, to: 0.7)
                        .stroke(Color.green, lineWidth: 7)
                        .frame(width: 100, height: 100)
                        .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                        .animation(Animation.linear(duration: 0.5).repeatForever(autoreverses: false), value: isLoading)
                        .onAppear(){
                            self.isLoading = true
                        }
                }
                Spacer()
                
                VStack{
                    Text("Loading")
                        .font(.system(.body, design: .rounded))
                        .bold()
                    ZStack{
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color(.systemGray5), lineWidth: 3)
                            .frame(width: 250, height: 3)
                        
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color(.green), lineWidth: 3)
                            .frame(width: 30, height: 3)
                            .offset(x: isLoading ? 110 : -110, y: 0)
                            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false), value: isLoading)
                    }
                    .onAppear(){
                        self.isLoading = true
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 100, trailing: 0))
                Spacer()
                
                
                ZStack{
                    Text("\(Int(progress * 100)) %")
                    
                    Circle()
                        .stroke(Color(.systemGray5), lineWidth: 10)
                        .frame(width: 150, height: 150)
                    
                    Circle()
                        .trim(from: 0, to: progress)
                        .stroke(Color(.green), lineWidth: 10)
                        .frame(width: 150, height: 150)
                        .rotationEffect(Angle(degrees: -90))
                }
                .onAppear(){
                    Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                        self.progress += 0.01 // 왜근데 0.05를 더할 때 0.05만 더해지는게 아니라 아주 미세하게 0.000000000000000001이런게 더해지는거지?
                        print(self.progress)
                        if self.progress  >= 1.00 {
//                            timer.invalidate()
                            progress = 0
                        }
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 100, trailing: 0))
                
                HStack{
                    ForEach(0...4, id: \.self) {index in
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundStyle(.green)
                            .scaleEffect(self.isLoading ? 0 : 1)
                            .animation(Animation.linear(duration: 0.6).repeatForever().delay(0.2 * Double(index)), value: isLoading)
                    }
                }
                .onAppear(){
                    self.isLoading = true
                }
                
                
                
                
                
            }

            
        }
    }
}



