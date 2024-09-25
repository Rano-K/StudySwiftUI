//
//  RestaurnatViewModel.swift
//  18_BottomSheet
//
//  Created by ms k on 6/20/24.
//

import SwiftUI

struct RestaurantViewModel: View {
    
    var restaurant : RestaurantModel
    
    var body: some View {
        HStack{
            Image(restaurant.image)
                .resizable()
                .frame(width: 40, height: 50)
                .cornerRadius(5)
            Text(restaurant.name)
        }
    }
}


