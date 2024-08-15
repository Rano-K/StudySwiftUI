//
//  ContentView.swift
//  10_List_ForEach_Identifiable
//
//  Created by ms k on 4/23/24.
//

import SwiftUI

struct ContentView: View {
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli" , "Waffle & Wolf",  "Cafe Lore", "Confessional", "Barrafina", "Donos tia", "Royal Oak"]
    
    var restaurantImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "forkeerestaurant", "posatelier", "bourkestreetbakery", "haighschocolate" , "palominoespresso", "upstate", "traif", "grahamavenuemeats", "wafflewolf", "cafelore", "confessional", "barrafina", "donostia", "royaloak"]
    
    
    
    
    var body: some View {
//        List(1...4, id: \.self){
//            Text("Item \($0)")
//        }
        
        List(restaurantNames.indices, id: \.self){index in
            HStack{
                Image(self.restaurantImages[index])
                    .resizable()
                    .frame(width: 40, height: 40)
                    .cornerRadius(3)
                Text(self.restaurantNames[index])
                    .font(.system(size: 18, design: .rounded))
                    .bold()
            }
        }
    }
}
