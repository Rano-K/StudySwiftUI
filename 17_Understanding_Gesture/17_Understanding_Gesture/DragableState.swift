//
//  DragableState.swift
//  17_Understanding_Gesture
//
//  Created by ms k on 6/19/24.
//

import SwiftUI

enum DragableState{
    case inactive
    case pressing
    case dragging(translation : CGSize)
    
    var translation : CGSize{
        switch self{
        case .inactive, .pressing:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isPressing : Bool{
        switch self{
        case .pressing, .dragging:
            return true
        case .inactive:
            return false
        }
    }
}
