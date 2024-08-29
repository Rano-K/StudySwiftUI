//
//  RestaurantModel.swift
//  13_Picker_Toggle
//
//  Created by ms k on 5/1/24.
//

import SwiftUI

struct Restaurant: Identifiable {
    var id = UUID()
    var name: String
    var type: String
    var phone: String
    var image: String
    var priceLevel: Int
    var isFavorite: Bool = false
    var isCheckIn: Bool = false
}
