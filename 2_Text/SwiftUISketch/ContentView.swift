//
//  ContentView.swift
//  SwiftUISketch
//
//  Created by ms k on 4/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.custom("Helvetica Neue", size: 25))
            Text("Hello, world!")
                .fontWeight(.bold)
                .font(.system(size: 25))
            Text("여러분의 시간은 제한되어 있습니다. 그러니 다른 사람들의 삶을 살아가는 데 시간을 낭비하지 마십시오. 다른 사람들의 사고 결과로 삶에 갇히지 마십시오. 다른 사람들의 의견 소음이 여러분의 내부 목소리를 묻지 못하게 허용하지 마십시오. 그리고 가장 중요한 것은 마음과 직감을 따르는 용기를 가지십시오.")
                .fontWeight(.bold)
                .font(.title)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .lineLimit(4)
                .truncationMode(.tail)
//                .rotationEffect(.degrees(20), anchor: UnitPoint(x: 0, y: 0))
                .rotation3DEffect(.degrees(60), axis: (x: 50, y: 5, z: 10))
                .shadow(color: .gray, radius: 2, x: 0, y: 15)






                
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
