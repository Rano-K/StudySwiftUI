//
//  ContentView.swift
//  30_ActivityRing(Shape,Animatable)
//
//  Created by ms k on 12/31/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var progress = 0.0
    
    var body: some View {
        VStack{
            ProgressRingView(progress: $progress)
            
            HStack{
                Group{
                    Text("0%")
                        .font(.system(.headline, design: .rounded))
                        .onTapGesture {
                            self.progress = 0.0
                        }
                    Text("50%")
                        .font(.system(.headline, design: .rounded))
                        .onTapGesture {
                            self.progress = 0.5
                        }
                    Text("100%")
                        .font(.system(.headline, design: .rounded))
                        .onTapGesture {
                            self.progress = 1.0
                        }
                }
                .padding()
                .background(Color(.systemGray4))
                .clipShape(RoundedRectangle(cornerRadius: 15.0, style: .continuous))
                .padding()
            }
            .padding()
        }
    }
}

