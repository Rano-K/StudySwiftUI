//
//  DragState.swift
//  20_Animation(AppleWallet)_Transition
//
//  Created by ms k on 7/5/24.
//

import Foundation

enum DragState{
    case inactive
    case pressing(index: Int? = nil)
    case dragging(index: Int? = nil, translation: CGSize)
    
    var index: Int? {
        switch self{
        case .pressing(let index), .dragging(let index,
                                             translation: _):
            return index
        case .inactive:
            return nil
        }
    }
    
    var translation: CGSize{
        switch self{
        case .inactive, .pressing:
            return .zero
            
        case .dragging(_, let translation):
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
    
    var isDragging : Bool{
        switch self{
        case .dragging:
            return true
        case .inactive, .pressing:
            return false
        }
    }
}

