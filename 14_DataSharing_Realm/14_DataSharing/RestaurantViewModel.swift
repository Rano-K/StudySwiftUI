//
//  RestaurantViewModel.swift
//  14_DataSharing
//
//  Created by ms k on 5/7/24.
//

import SwiftUI

struct RestaurantViewModel : View {
    
    var restaurant : RestaurantModel
    
    var body: some View {
        HStack {
            Image(restaurant.image)
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .padding(.trailing, 10)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(restaurant.name)
                        .font(.system(.body, design: .rounded))
                        .bold()
                    
                    Text(String(repeating: "$", count: restaurant.priceLevel))
                        .font(.subheadline)
                        .foregroundColor(.gray)

                }
                
                Text(restaurant.type)
                    .font(.system(.subheadline, design: .rounded))
                    .bold()
                    .foregroundColor(.secondary)
                    .lineLimit(3)
                
                Text(restaurant.phone)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.secondary)
            }
            
            Spacer()
                .layoutPriority(-100)
            
            if restaurant.isCheckIn {
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(.red)
            }
            
            if restaurant.isFavorite {
//                    Spacer()
                
                Image(systemName: "star.fill")
                .foregroundColor(.yellow)
            }
        }
    }
    

}
