//
//  BlankView.swift
//  22_TODO_APP(SwiftData)
//
//  Created by ms k on 7/20/24.
//

import SwiftUI

struct BlankView: View {
    
    var bgColor : Color
    
    var body: some View {
        VStack{
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(bgColor)
        .edgesIgnoringSafeArea(.all)
    }
}

