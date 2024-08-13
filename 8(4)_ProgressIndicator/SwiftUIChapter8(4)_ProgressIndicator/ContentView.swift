//
//  ContentView.swift
//  SwiftUIChapter8(4)_ProgressIndicator
//
//  Created by ms k on 4/21/24.
//

import SwiftUI

struct ContentView: View {
    
    private var purpleGrdient = LinearGradient(gradient: Gradient(colors: [
                                                                            Color(red: 207/255, green: 150/255, blue: 207/255),
                                                                            Color(red: 107/255, green: 116/255, blue: 179/255)
                                                                          ]),
                                               startPoint: .trailing,
                                               endPoint: .leading)

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color(.systemGray6), lineWidth: 20)
                .frame(width: 300, height: 300)
            Circle()
                .trim(from: 0, to: 0.85)
                .stroke(purpleGrdient, lineWidth: 20)
                .frame(width: 300, height: 300)
                .overlay(
                    VStack{
                        Text("85%")
                            .font(.system(size: 80, weight: .bold, design: .rounded))
                            .foregroundStyle(Color(.systemGray))
                        Text("Complete")
                            .font(.system(.body, design: .rounded))
                            .bold()
                            .foregroundStyle(Color(.systemGray))
                    }
                )
        }
        .padding()
    }
}
