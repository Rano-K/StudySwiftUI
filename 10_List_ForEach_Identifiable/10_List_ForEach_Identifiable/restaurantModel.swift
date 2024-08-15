//
//  restaurantModel.swift
//  10_List_ForEach_Identifiable
//
//  Created by ms k on 4/24/24.
//

import SwiftUI

struct Restaurant{
    
    var name : String
    var image : String

}

struct Restaurant_UUID : Identifiable{
    
    var id = UUID()
    var name : String
    var image : String
}
