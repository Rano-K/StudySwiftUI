//
//  UsingDragableView.swift
//  17_Understanding_Gesture
//
//  Created by ms k on 6/19/24.
//

import SwiftUI

struct UsingDragableView: View {
    var body: some View {
        VStack{
            DragableView(content: {
                VStack{
                    Image(systemName: "star.circle.fill")
                        .font(.system(size: 100))
                        .foregroundStyle(.gray)
                    Image(systemName: "star.circle")
                        .font(.system(size: 100))
                        .foregroundStyle(.blue)
                    Text("Dragable")
                        .font(.system(size: 100))
                        .foregroundStyle(.red)
                }
                
                
            })
            DragableView(content: {
                VStack{
                    Text("Another")
                        .font(.system(size: 50, design: .rounded))
                }
            })
        }
        
    }
}
