//
//  ContentView.swift
//  SwiftUIChapter7_2_ButtonExport
//
//  Created by ms k on 4/20/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var counter1 = 1
    @State private var counter2 = 1
    @State private var counter3 = 1
    var total : Int {
        return counter1 + counter2 + counter3
    }
    
    var body: some View {
        VStack{
            
            Text("\(total)")
                .font(.system(size: total >= 100000 ? 80 : 100, weight: .black, design: .rounded))
                
                
            HStack {
                CounterButton(counter: $counter1, color: .red)
                CounterButton(counter: $counter2, color: .green)
                CounterButton(counter: $counter3, color: .blue)
            }
            .padding()
        }
    }
}

struct CounterButton : View {
    
    @Binding var counter : Int
    var color : Color
    
    var body: some View {
        Button(action: {
            self.counter += 1
        }){
            ZStack{
                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(color)
                Text("\(counter)")
                    .font(.system(size: counter >= 10000 ? 20 : (counter >= 1000 ? 30 : 40), weight: .bold, design: .rounded))
                    .foregroundStyle(.white)
            }
        }
    }
}


