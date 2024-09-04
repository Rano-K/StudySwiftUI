//
//  Restaurant_ViewModel.swift
//  16_SwipeDelete_ContextMenu_ActionSheets
//
//  Created by ms k on 6/13/24.
//

import SwiftUI

struct Restaurant_ViewModel : View{
    var restaurant : Restaurant
    
    var body: some View{
        HStack{
            Image(restaurant.image)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            Text(restaurant.name)
            if restaurant.isCheckIn == true{
                Image(systemName: "checkmark.seal.fill")
                    .foregroundStyle(.red)
            }
            if restaurant.isFavorite == true{
                Spacer()
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
            
        }
    }
}
