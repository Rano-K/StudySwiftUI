import SwiftUI

struct FullImageRow: View {
    
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
        List(restaurants_UUID){ restaurant in
            FullImageRow_struct(restaurant: restaurant)
        }
        
    }
}

struct FullImageRow_struct: View {
    
    var restaurant : Restaurant_UUID
    
    var body: some View {
        ZStack{
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .cornerRadius(10)
                .overlay(
                    Rectangle()
                        .foregroundStyle(.black)
                        .cornerRadius(10)
                        .opacity(0.2)
                )
            
            Text(restaurant.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundStyle(.white)
        }
    }
}

