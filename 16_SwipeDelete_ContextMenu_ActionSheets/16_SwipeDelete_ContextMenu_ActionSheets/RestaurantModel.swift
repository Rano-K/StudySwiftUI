//
//  Restaurant.swift
//  16_SwipeDelete_ContextMenu_ActionSheets
//
//  Created by ms k on 6/13/24.
//

import SwiftUI

struct Restaurant: Identifiable {
    var id = UUID()
    var name : String
    var image : String
    var isFavorite : Bool = false
    var isCheckIn : Bool = false
}

