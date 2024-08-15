//
//  ContentView.swift
//  11_NavigationUI_NavigationBar
//
//  Created by ms k on 4/28/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var dismissCount : Int = 0
    
    var restaurants = [ Restaurant(name: "Cafe Deadend", image: "cafedeadend"),
                   Restaurant(name: "Homei", image: "homei"),
                   Restaurant(name: "Teakha", image: "teakha"),
                   Restaurant(name: "Cafe Loisl", image: "cafeloisl"),
                   Restaurant(name: "Petite Oyster", image: "petiteoyster"),
                   Restaurant(name: "For Kee Restaurant", image: "forkeerestaurant"),
                   Restaurant(name: "Po's Atelier", image: "posatelier"),
                   Restaurant(name: "Bourke Street Bakery", image: "bourkestreetbakery"),
                   Restaurant(name: "Haigh's Chocolate", image: "haighschocolate"),
                   Restaurant(name: "Palomino Espresso", image: "palominoespresso"),
                   Restaurant(name: "Homei", image: "upstate"),
                   Restaurant(name: "Traif", image: "traif"),
                   Restaurant(name: "Graham Avenue Meats And Deli", image: "grahamavenuemeats"),
                   Restaurant(name: "Waffle & Wolf", image: "wafflewolf"),
                   Restaurant(name: "Five Leaves", image: "fiveleaves"),
                   Restaurant(name: "Cafe Lore", image: "cafelore"),
                   Restaurant(name: "Confessional", image: "confessional"),
                   Restaurant(name: "Barrafina", image: "barrafina"),
                   Restaurant(name: "Donostia", image: "donostia"),
                   Restaurant(name: "Royal Oak", image: "royaloak"),
                   Restaurant(name: "CASK Pub and Kitchen", image: "caskpubkitchen")
    ]
    
    var body: some View {
        
//        List {
//            ForEach(restaurants) { restaurant in
//                BasicImageRow(restaurant: restaurant)
//            }
//        }
//        .navigationTitle("Restaurants")
        Text("DismissCount : \(dismissCount)")
        NavigationStack{
            
            List{
                ForEach(restaurants) { restaurant in
                    NavigationLink(destination: DetailView(dismissCount: $dismissCount, restaurant: restaurant)){
                        BasicImageRow(restaurant: restaurant)
                    }
                }
            }
            .navigationTitle("Restaurants")
            .toolbar{
                ToolbarItem(placement: .automatic){
                    Button{
                        print("tap1!")
                    } label: {
                        Label("profile", systemImage: "person.crop.circle")
                    }
                }
                ToolbarItem(placement: .navigation){
                    Button{
                        print("tap2!")
                    } label: {
                        Label("profile", systemImage: "person.circle.fill")
                    }
                }
                
                ToolbarItemGroup(placement: .secondaryAction){
                    Button{
                        print("tap3!")
                    } label: {
                        Label("profile", systemImage: "globe.americas")
                    }
                    Button{
                        print("tap4!")
                    } label: {
                        Label("profile", systemImage: "globe.americas.fill")
                    }
                }
            }
        }
    }
    
    // =========func===========
    
    // ================Color, Font Change function START==================
    
//    init() {
//        //navigationBar을 정의
//        let naviBarAppearance = UINavigationBarAppearance()
//        //navigationBackButton을 정의
//        let backItemAppearance = UIBarButtonItemAppearance()
//        
//        naviBarAppearance.largeTitleTextAttributes = [
//            .foregroundColor: UIColor.systemRed,
//            .font: UIFont(name: "ArialRoundedMTBold", size: 35)!
//        ]
//        naviBarAppearance.titleTextAttributes = [
//            .foregroundColor: UIColor.systemRed,
//            .font: UIFont(name: "ArialRoundedMTBold", size: 20)!
//        ]
//        naviBarAppearance.setBackIndicatorImage(UIImage(systemName: "arrow.turn.up.left"), transitionMaskImage: UIImage(systemName: "arrow.turn.up.left"))
//        
//        
//        
//        backItemAppearance.normal.titleTextAttributes = [.foregroundColor : UIColor.black]
//        naviBarAppearance.backButtonAppearance = backItemAppearance
//
//// ============
//        UINavigationBar.appearance().standardAppearance = naviBarAppearance
//        UINavigationBar.appearance().scrollEdgeAppearance = naviBarAppearance
//        UINavigationBar.appearance().compactAppearance = naviBarAppearance
//        UINavigationBar.appearance().barTintColor = .gray
//        UINavigationBar.appearance().tintColor = .black
//        
//        UINavigationBar.appearance().backgroundColor = .black
//    }
    
    // ================Color, Font Change function END==================
}


struct BasicImageRow: View {
    var restaurant: Restaurant
    
    var body: some View {
        HStack {
            Image(restaurant.image)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            Text(restaurant.name)
                .bold()
        }
    }
}

