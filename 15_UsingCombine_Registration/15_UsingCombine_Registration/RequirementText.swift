//
//  RequirementText.swift
//  15_UsingCombine_Registration
//
//  Created by ms k on 6/5/24.
//

import SwiftUI

struct RequirementText: View {
    
    var iconName =  "xmark.square"
    var iconColor = Color(red: 251/255, green: 128/255, blue: 128/255)
    
    var text = ""
    var isStrikeThrough = false//취소선
    
    var body: some View {
        HStack{
            Image(systemName: iconName)
                .foregroundStyle(iconColor)
            Text(text)
                .font(.system(.body, design: .rounded))
                .foregroundStyle(.secondary)
                .strikethrough(isStrikeThrough)
            Spacer()
        }
    }
}
