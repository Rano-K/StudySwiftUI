//
//  ContentView.swift
//  17_Understanding_Gesture
//
//  Created by ms k on 6/16/24.
//

import SwiftUI

struct ContentView: View {
    
    @GestureState private var longPressTap = false
    @State private var isPressed : Bool = false
    
    //dragOffset : 초기 시작지점을 결정한다.
    @GestureState private var dragOffset = CGSize.zero
    //Position : Drag한 마지막지점을 결정한다.
    @GestureState private var dragOffset1 = CGSize.zero
    @State private var position = CGSize.zero
    
    
    var body: some View {
        //Image Gesture Test
//        Image(systemName: "star.circle.fill")
//            .font(.system(size: 200))
//            .foregroundStyle(.green)
//            .onTapGesture {
//                print("onTapGesture : CHECK")
//            }
//            .simultaneousGesture(
//                TapGesture()
//                    .onEnded{print("gesture : Check")}
////                    .onEnded{print("check")}
//            )
//        Image(systemName: "star.circle.fill")
//           .font(.system(size: 200))
//           .scaleEffect(isPressed ? 0.5 : 1.0)
//           .animation(.easeInOut, value: isPressed)
//           .foregroundColor(.red)
//           .gesture(
//               TapGesture()
//                   .onEnded({
//                       self.isPressed.toggle()
//                   })
//           )
        ScrollView{
            Image(systemName: "star.circle.fill")
               .font(.system(size: 200))
               .opacity(longPressTap ? 0.4 : 1.0)
               .scaleEffect(isPressed ? 0.5 : 1.0)
               .animation(.easeInOut, value: isPressed)
               .foregroundColor(.red)
               .gesture(
                    LongPressGesture(minimumDuration: 1.0)
                    
                        .updating($longPressTap, body: { (currentState, state, transaction) in
                                        state = currentState
                                        print(currentState)
                            print(state)
                            print(transaction)
                                    })
                        .onEnded({_ in
                           self.isPressed.toggle()
                       })
               )
            
            Image(systemName: "star.circle.fill")
                .font(.system(size: 100))
                .offset(x: dragOffset.width, y: dragOffset.height)
                .animation(.easeInOut, value: dragOffset)
                .foregroundStyle(.green)
                .gesture(
                    DragGesture()
                        .updating($dragOffset, body: { (currentState, state, transaction) in
                            
                            state = currentState.translation
                            
                        })
                )
            //Drag & position at DragPoint
            Image(systemName: "star.circle.fill")
                .font(.system(size: 100))
                .offset(x: position.width + dragOffset1.width, y: position.height + dragOffset1.height)
                .animation(.easeInOut, value: dragOffset1)
                .foregroundStyle(.orange)
                .gesture(
                    DragGesture()
                        .updating($dragOffset1, body: { (currentState, state, transaction) in
                            
                            state = currentState.translation
                            
                        })
                        .onEnded({(currentState) in
                            
                            self.position.height += currentState.translation.height
                            self.position.width  += currentState.translation.width
                            
                        })
                )
            
            //if I use simultaneous
            
        }
        
    }
}


