//
//  DragState.swift
//  17_Understanding_Gesture
//
//  Created by ms k on 6/19/24.
//

import Foundation
import SwiftUI

enum DragState{
    case inactive //제스처가 비활성화된 상태. 사용자가 화면을 터치하고 있지 않는 상태.
    case pressing //사용자가 화면을 길게 누르고 있는 상태.
    //사용자가 화면을 드래그하고 있는 상태.
    //translation을 연관시켜 드래그의 이동거리를 표현할 상태.
    case dragging(translation : CGSize)
    
    //현재 상태에 따른 이동거리를 반환한다.
    var translation : CGSize{
        switch self {
        case .inactive, .pressing:       //inactive, pressing에서는 이동거리가 없으므로
            return .zero                 //zero를 반환한다.
        case .dragging(let translation): //dragging상태에서는 이동거리가 있으므로
            return translation           //이동거리를 표현하는 translation을 반환한다.
        }
    }
    
    //현재 상태가 길게 누르기 인지, 드래그 중인지 여부를 반환한다.
    var isPressing : Bool{
        switch self{
        case .pressing, .dragging:       //pressing, dragging상태에서는
            return true                  //true를 반환
        case .inactive:                  //inactive에서는 아무 제스처도 수행하지 않으므로
            return false                 //false를 반환
        }
    }
    
}
