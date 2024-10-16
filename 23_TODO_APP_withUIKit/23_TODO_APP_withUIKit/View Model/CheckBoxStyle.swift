//
//  CheckBoxStyle.swift
//  22_TODO_APP(SwiftData)
//
//  Created by ms k on 7/19/24.
//
///
///makeBody의 주요 구성요소인 makeBody메서드를 구현.
///configuration.isOn에 따라 체크마크 이미지 or 빈 서클 이미지를 구현.
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
