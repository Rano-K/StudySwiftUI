//
//  RestaurantDetailView.swift
//  18_BottomSheet
//
//  Created by ms k on 6/20/24.
//

import SwiftUI

struct RestaurantDetailView: View {
    
    let restaurantModel : RestaurantModel
    
    var body: some View {
        VStack{
            Spacer()
            HandleBar()
            ScrollView(.vertical){
                TitleBar()
                HeaderView(restaurantModel: self.restaurantModel)
                DetailInfoView(icon: "map", info: self.restaurantModel.location)
                    .padding(.top)
                DetailInfoView(icon: "phone", info: self.restaurantModel.phone)
                DetailInfoView(icon: nil, info: self.restaurantModel.description)
                    .padding(.top)
            }
            .background(.white)
            .cornerRadius(10, antialiased: true)
        }
    }
}

