//
//  DragGesture.swift
//  19_Gesture_Animation_(tinderUI)
//
//  Created by ms k on 6/28/24.
//

import Foundation
import SwiftUI

enum DragState{
    case inactive // 동작하지 않을 때
    case pressing // 누를 때
    case dragging(translation : CGSize) //Swipe할 때
    
    var translation : CGSize{
        switch self{
        case .inactive, .pressing:
            return .zero
        case .dragging(let translation) :
            return translation
        }
    }
    
    var isDragging : Bool {
        switch self{
        case .dragging:
            return true
        case .pressing, .inactive:
            return false
        }
    }
    
    var isPressing : Bool {
        switch self{
        case .pressing, .dragging:
            return true
        case .inactive:
            return false
        }
    }
}
