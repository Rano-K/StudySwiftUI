//
//  keyboardSetting.swift
//  18_BottomSheet
//
//  Created by ms k on 6/25/24.
//

import SwiftUI

extension UIApplication {
    func addTabGestureRecognizer(){
        guard let window = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            return
        }
        let tabGesture = UITapGestureRecognizer(target: window, action: #selector(UIView.endEditing))
        tabGesture.requiresExclusiveTouchType = false
        tabGesture.cancelsTouchesInView = false
        tabGesture.delegate = self
        
    }
}

extension UIApplication : UIGestureRecognizerDelegate{
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
