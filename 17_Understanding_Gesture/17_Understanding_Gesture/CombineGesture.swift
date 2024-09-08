//
//  CombineGesture.swift
//  17_Understanding_Gesture
//
//  Created by ms k on 6/17/24.
//

import SwiftUI

struct CombineGesture: View {
    
    //LongPressed를 위한 길게 눌렀는지 아닌지 판단할 변수
    @GestureState private var isPressed : Bool = false
    //DragGesture를 위한 상태변수
    @GestureState private var dragOffset = CGSize.zero
    @State private var position = CGSize.zero
    
    
    var body: some View {
        Image(systemName: "star.circle")
            .font(.system(size: 100))
            .opacity(isPressed ? 0.5 : 1.0)
            .offset(x: position.width + dragOffset.width, y: position.height + dragOffset.height)
            .animation(.easeInOut, value: dragOffset)
            .foregroundStyle(.cyan)
            .gesture(
                LongPressGesture(minimumDuration: 0.5)
                    .updating($isPressed, body: { (currentState, state, transaction) in
                        state = currentState
                    })
                    .sequenced(before: DragGesture())
                    .updating($dragOffset, body: {( value, state, transaction) in
                        
                        switch value{
                        case.first(true):
                            print("Tapping")
                        case.second(true, let drag):
                            state = drag?.translation ?? .zero
                        default:
                            break
                        }
                    })
                    .onEnded({ (value) in
                        
                        guard case .second(true, let drag?) = value else{
                            return
                        }
                        self.position.width += drag.translation.width
                        self.position.height += drag.translation.height
                    })
            )
    }
}





































//struct CombineGesture: View {
//    // 길게 누르기 제스처를 위한 상태
//    @GestureState private var isPressed = false
//    // 드래그 제스처를 위한 상태
//    @GestureState private var dragOffset = CGSize.zero
//    @State private var position = CGSize.zero
//
//    // 경로를 저장하는 상태
//    @State private var path = Path()
//
//    var body: some View {
//        ZStack {
//            // 경로를 그리는 Shape
//            PathShape(path: path)
//                .stroke(Color.cyan, lineWidth: 20)
//
//            Image(systemName: "star.circle.fill")
//                .font(.system(size: 50))
//                .opacity(isPressed ? 0.5 : 1.0)
//                .offset(x: position.width + dragOffset.width, y: position.height + dragOffset.height)
//                .animation(.easeInOut, value: dragOffset)
//                .foregroundColor(.green)
//                .gesture(
//                    LongPressGesture(minimumDuration: 0.5)
//                        .updating($isPressed, body: { (currentState, state, transaction) in
//                            state = currentState
//                        })
//                        .sequenced(before: DragGesture())
//                        .updating($dragOffset, body: { (value, state, transaction) in
//                            switch value {
//                            case .first(true):
//                                print("Tapping")
//                            case .second(true, let drag):
//                                state = drag?.translation ?? .zero
//                            default:
//                                break
//                            }
//                        })
//                        .onEnded({ (value) in
//                            guard case .second(true, let drag?) = value else {
//                                return
//                            }
//                            self.position.height += drag.translation.height
//                            self.position.width += drag.translation.width
//                            self.updatePath(with: drag.translation)
//                        })
//                )
//        }
//    }
//
//    // 경로를 업데이트하는 함수
//    private func updatePath(with translation: CGSize) {
//        let newPoint = CGPoint(x: position.width + translation.width, y: position.height + translation.height)
//        if path.isEmpty {
//            path.move(to: newPoint)
//        } else {
//            path.addLine(to: newPoint)
//        }
//    }
//}
//
//// 경로를 그리는 Shape
//struct PathShape: Shape {
//    var path: Path
//
//    func path(in rect: CGRect) -> Path {
//        return path
//    }
//}
