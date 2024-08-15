//
//  FullImage_with_BasicImage.swift
//  10_List_ForEach_Identifiable
//
//  Created by ms k on 4/25/24.
//

import SwiftUI

// Full Image 와 Basic Image를 같이 쓰는 방법
struct FullImage_with_BasicImage: View {
    
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
        // Int 타입의 해당 인덱스 값을 식별자로 사용하게 된다.
        List(restaurants_UUID.indices, id: \.self){ index in
            if(0...1).contains(index){
                FullImageRow_struct(restaurant: self.restaurants_UUID[index])
            }else{
                BasicImageRow(restaurant: self.restaurants_UUID[index])
            }
        }
        
    }

}


