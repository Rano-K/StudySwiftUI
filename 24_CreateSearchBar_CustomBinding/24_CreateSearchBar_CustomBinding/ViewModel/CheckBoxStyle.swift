//
//  CheckBoxStylr.swift
//  24_CreateSearchBar_CustomBinding
//
//  Created by ms k on 7/25/24.
//

import SwiftUI

struct CheckBoxStyle: ToggleStyle{
    func makeBody(configuration: Self.Configuration) -> some View {
        return HStack{
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundStyle(configuration.isOn ? .purple : .gray)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .onTapGesture {
                    configuration.isOn.toggle()
                    print(configuration.label)
                }
            
            Spacer(minLength: 20)
            
            configuration.label
            
        }
    }
}
