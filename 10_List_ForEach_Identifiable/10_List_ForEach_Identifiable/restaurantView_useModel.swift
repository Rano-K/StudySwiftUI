//
//  restaurantView_useModel.swift
//  10_List_ForEach_Identifiable
//
//  Created by ms k on 4/24/24.
//

import SwiftUI

struct restaurantView_useModel: View {
    
//    var restaurants = [
//        Restaurant(name: "Cafe Deadend", image: "cafedeadend"),
//        Restaurant(name: "Homei", image: "homei"),
//        Restaurant(name: "Teakha", image: "teakha"),
//        Restaurant(name: "Cafe Loisl", image: "cafeloisl"),
//        Restaurant(name: "For Kee Restaurant", image: "forkeerestaurant"),
//        Restaurant(name: "Po's Atelier", image: "posatelier"),
//        Restaurant(name: "Bourke Street Bakery", image: "bourkestreetbakery"),
//        Restaurant(name: "Haigh's Chocolate", image: "haighschocolate"),
//        Restaurant(name: "Palomino Espresso", image: "palominoespresso"),
//        Restaurant(name: "Homei", image: "upstate"),
//        Restaurant(name: "Traif", image: "traif"),
//        Restaurant(name: "Graham Avenue Meats And Deli", image: "grahamavenuemeats"),
//        Restaurant(name: "Waffle & Wolf", image: "wafflewolf"),
//        Restaurant(name: "Cafe Lore", image: "cafelore"),
//        Restaurant(name: "Confessional", image: "confessional"),
//        Restaurant(name: "Barrafina", image: "barrafina"),
//        Restaurant(name: "Donostia", image: "donostia"),
//        Restaurant(name: "Royal Oak", image: "royaloak")
//    ]
    var restaurants_UUID = [
        Restaurant_UUID(name: "Cafe Deadend", image: "cafedeadend"),
        Restaurant_UUID(name: "Homei", image: "homei"),
        Restaurant_UUID(name: "Teakha", image: "teakha"),
        Restaurant_UUID(name: "Cafe Loisl", image: "cafeloisl"),
        Restaurant_UUID(name: "For Kee Restaurant", image: "forkeerestaurant"),
        Restaurant_UUID(name: "Po's Atelier", image: "posatelier"),
        Restaurant_UUID(name: "Bourke Street Bakery", image: "bourkestreetbakery"),
        Restaurant_UUID(name: "Haigh's Chocolate", image: "haighschocolate"),
        Restaurant_UUID(name: "Palomino Espresso", image: "palominoespresso"),
        Restaurant_UUID(name: "Homei", image: "upstate"),
        Restaurant_UUID(name: "Traif", image: "traif"),
        Restaurant_UUID(name: "Graham Avenue Meats And Deli", image: "grahamavenuemeats"),
        Restaurant_UUID(name: "Waffle & Wolf", image: "wafflewolf"),
        Restaurant_UUID(name: "Cafe Lore", image: "cafelore"),
        Restaurant_UUID(name: "Confessional", image: "confessional"),
        Restaurant_UUID(name: "Barrafina", image: "barrafina"),
        Restaurant_UUID(name: "Donostia", image: "donostia"),
        Restaurant_UUID(name: "Royal Oak", image: "royaloak")
    ]

    
    var body: some View {
//        List(restaurants_UUID, id: \.id){ restaurant in
//            HStack{
//                Image(restaurant.image)
//                    .resizable()
//                    .frame(width: 40, height: 40)
//                    .cornerRadius(5)
//                Text(restaurant.name)
//                    .font(.system(size: 18, design: .rounded))
//                    .bold()
//            }
//            
//        }
        List(restaurants_UUID){ restaurant in
            BasicImageRow(restaurant: restaurant)
        }
        
    }
}

struct BasicImageRow : View {
    
    var restaurant : Restaurant_UUID
    
    var body: some View{
        HStack{
            Image(restaurant.image)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            Text(restaurant.name)
                .font(.system(size: 18, design: .rounded))
                .bold()
        }
    }
}

