//
//  Text.swift
//  31_AnimatableModifier
//
//  Created by ms k on 1/10/25.
//

import Foundation
import SwiftUI

struct TextModifier : Animatable, ViewModifier{
    
    var progressAll : Double
    var textColor : Color = .primary
    
    private var progressText : String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.percentSymbol = "%"
        
        return formatter.string(from: NSNumber(value: progressAll)) ?? ""
    }
    
    var animatableData: Double{
        get { progressAll }
        set { progressAll = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .overlay(content: {
                Text(progressText)
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundStyle(textColor)
                    .animation(.easeOut)
            })
    }
}

extension View{
    func animatableOverallText(progressAll : Double, textColor : Color = Color.primary) -> some View{
        self.modifier(TextModifier(progressAll: progressAll, textColor: textColor))
    }
}
