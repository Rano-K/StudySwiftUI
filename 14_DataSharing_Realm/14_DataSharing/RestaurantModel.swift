//
//  RestaurantModel.swift
//  14_DataSharing
//
//  Created by ms k on 5/7/24.
//

import SwiftUI

struct RestaurantModel: Identifiable {
    var id = UUID()
    var name: String
    var type: String
    var phone: String
    var image: String
    var priceLevel: Int
    var isFavorite: Bool = false
    var isCheckIn: Bool = false
}

enum RestaurantEnumModel : Int, CaseIterable{
    case alphabetical = 0
    case favoriteFirst = 1
    case checkInFirst = 2
    
    
    //초기화 :
    //init은 정수값을 받아서 RestaurantEnumModel에 case로 mapping한다.
    init(type : Int) {
        switch type {
        case 0: self = .alphabetical
        case 1: self = .favoriteFirst
        case 2: self = .checkInFirst
        default: self = .alphabetical //default는 .alphabetical
            
        }
    }
    
    //text는 각 case에 해당하는 Text를 반환.
    var text : String{
        switch self {
        case .alphabetical : 
            return "Alphabetical"
        case .favoriteFirst : 
            return "Show Favorite First"
        case .checkInFirst : 
            return "Show Check-In First"
        }
    }
    
    func predicate() -> ((RestaurantModel, RestaurantModel) -> Bool) {
        switch self {
        case .alphabetical: return { $0.name < $1.name }
        case .favoriteFirst: return { $0.isFavorite && !$1.isFavorite }
        case .checkInFirst: return { $0.isCheckIn && !$1.isCheckIn }
        }
    }
}

