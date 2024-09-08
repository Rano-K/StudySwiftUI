//
//  General_GestureVIew.swift
//  17_Understanding_Gesture
//
//  Created by ms k on 6/19/24.
//

import SwiftUI

struct DragableView<Content>: View where Content: View{
    
    @GestureState private var dragState = DragableState.inactive
    @State var position = CGSize.zero
    var content : () -> Content
    
    var body: some View {
        content()
            .opacity(dragState.isPressing ? 0.5 : 1.0)
            .offset(
                x: position.width + dragState.translation.width,
                y: position.height + dragState.translation.height
            )
            .animation(.easeInOut(duration: 0.5), value: dragState.translation)
            .gesture(
                LongPressGesture(minimumDuration: 0.5)
                    .sequenced(before: DragGesture())
                    .updating($dragState,
                              body: { (value, state, transaction) in
                                  switch value{
                                  case .first(true):
                                      state = .pressing
                                  case .second(true, let drag):
                                      state = .dragging(translation: drag?.translation ?? .zero)
                                  default:
                                      break
                                  }
                              })
                    .onEnded({ (value) in
                        guard case .second(true, let drag?) = value else{
                            return
                        }
                        self.position.height += drag.translation.height
                        self.position.width += drag.translation.width
                    })
            )
        
    }
}
