//
//  Gesture_Enum.swift
//  17_Understanding_Gesture
//
//  Created by ms k on 6/19/24.
//

import SwiftUI

struct Gesture_Enum : View {
    
    @GestureState private var dragState = DragState.inactive
    @State var position = CGSize.zero
    
    var body: some View {
        Image(systemName: "star.circle.fill")
            .font(.system(size: 100))
            .opacity(dragState.isPressing ? 0.5 : 1.0)
            .offset(x: position.width + dragState.translation.width, y: position.height + dragState.translation.height)
            .animation(.easeInOut, value: dragState.translation)
            .foregroundColor(.green)
            .gesture(
                LongPressGesture(minimumDuration: 1.0)
                    .sequenced(before: DragGesture())
                    .updating($dragState, body: {(value, state, transaction) in
                        switch value{
                        case .first(true):
                            state = .pressing
                        case .second(true, let drag):
                            state = .dragging(translation: drag?.translation ?? .zero)
                        default:
                            break
                        }
                    })
                    
                    .onEnded({(value) in
                        guard case .second(true, let drag?) = value else{
                            return
                        }
                        self.position.width += drag.translation.width
                        self.position.height += drag.translation.height
                    })
            )
    }
}
