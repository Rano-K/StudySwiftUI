//
//  ContentView.swift
//  30_ActivityRing(Shape,Animatable)
//
//  Created by ms k on 12/19/24.
//

import SwiftUI

struct TestView: View {
    
    var body: some View {
        AngularGradient(
            gradient: Gradient(colors: [.darkPurple, .lightYellow]),
            center: .center,
            startAngle: .degrees(0),
            endAngle: .degrees(180)
        )
    }
}
