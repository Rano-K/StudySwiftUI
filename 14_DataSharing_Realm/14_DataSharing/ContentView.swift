//
//  ContentView.swift
//  14_DataSharing
//
//  Created by ms k on 5/7/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var restaurants = [
        RestaurantModel(name: "Cafe Deadend", type: "Coffee & Tea Shop", phone: "232-923423", image: "cafedeadend", priceLevel: 3),
        RestaurantModel(name: "Homei", type: "Cafe", phone: "348-233423", image: "homei", priceLevel: 3),
        RestaurantModel(name: "Teakha", type: "Tea House", phone: "354-243523", image: "teakha", priceLevel: 3, isFavorite: true, isCheckIn: true),
        RestaurantModel(name: "Cafe loisl", type: "Austrian / Casual Drink", phone: "453-333423", image: "cafeloisl", priceLevel: 2, isFavorite: true, isCheckIn: true),
        RestaurantModel(name: "Petite Oyster", type: "French", phone: "983-284334", image: "petiteoyster", priceLevel: 5, isCheckIn: true),
        RestaurantModel(name: "For Kee Restaurant", type: "Hong Kong", phone: "232-434222", image: "forkeerestaurant", priceLevel: 2, isFavorite: true, isCheckIn: true),
        RestaurantModel(name: "Po's Atelier", type: "Bakery", phone: "234-834322", image: "posatelier", priceLevel: 4),
        RestaurantModel(name: "Bourke Street Backery", type: "Chocolate", phone: "982-434343", image: "bourkestreetbakery", priceLevel: 4, isCheckIn: true),
        RestaurantModel(name: "Haigh's Chocolate", type: "Cafe", phone: "734-232323", image: "haighschocolate", priceLevel: 3, isFavorite: true),
        RestaurantModel(name: "Palomino Espresso", type: "American / Seafood", phone: "872-734343", image: "palominoespresso", priceLevel: 2),
        RestaurantModel(name: "Upstate", type: "Seafood", phone: "343-233221", image: "upstate", priceLevel: 4),
        RestaurantModel(name: "Traif", type: "American", phone: "985-723623", image: "traif", priceLevel: 5),
        RestaurantModel(name: "Graham Avenue Meats", type: "Breakfast & Brunch", phone: "455-232345", image: "grahamavenuemeats", priceLevel: 3),
        RestaurantModel(name: "Waffle & Wolf", type: "Coffee & Tea", phone: "434-232322", image: "wafflewolf", priceLevel: 3),
        RestaurantModel(name: "Five Leaves", type: "Bistro", phone: "343-234553", image: "fiveleaves", priceLevel: 4, isFavorite: true, isCheckIn: true),
        RestaurantModel(name: "Cafe Lore", type: "Latin American", phone: "342-455433", image: "cafelore", priceLevel: 2, isFavorite: true, isCheckIn: true),
        RestaurantModel(name: "Confessional", type: "Spanish", phone: "643-332323", image: "confessional", priceLevel: 4),
        RestaurantModel(name: "Barrafina", type: "Spanish", phone: "542-343434", image: "barrafina", priceLevel: 2, isCheckIn: true),
        RestaurantModel(name: "Donostia", type: "Spanish", phone: "722-232323", image: "donostia", priceLevel: 1),
        RestaurantModel(name: "Royal Oak", type: "British", phone: "343-988834", image: "royaloak", priceLevel: 2, isFavorite: true),
        RestaurantModel(name: "CASK Pub and Kitchen", type: "Thai", phone: "432-344050", image: "caskpubkitchen", priceLevel: 1)
        ]

    @State private var selectedRestaurant: RestaurantModel?
    @State private var showSettings: Bool = false
    //DataStore 사용하기위해 선언.
    //SettingDataStore가 ObservableObject이므로 EnvironmentObject로 변경
    @EnvironmentObject var settingStore : SettingDataStore
    
    
    var body: some View {
        NavigationStack {
            List {
//                ForEach(restaurants) { restaurant in
                ForEach(restaurants.filter { self.shouldShowItem(restaurant: $0)}
                    .sorted(by: self.settingStore.displayOrder.predicate()), id: \.id){restaurant in
//                    if self.shouldShowItem(restaurant: restaurant){
                    RestaurantViewModel(restaurant: restaurant)
                        .contextMenu {
                            
                            Button(action: {
                                // mark the selected restaurant as check-in
                                self.checkIn(item: restaurant)
                            }) {
                                HStack {
                                    Text("Check-in")
                                    Image(systemName: "checkmark.seal.fill")
                                }
                            }
                            
                            Button(action: {
                                // delete the selected restaurant
                                self.delete(item: restaurant)
                            }) {
                                HStack {
                                    Text("Delete")
                                    Image(systemName: "trash")
                                }
                            }
                            
                            Button(action: {
                                // mark the selected restaurant as favorite
                                self.setFavorite(item: restaurant)
                                
                            }) {
                                HStack {
                                    Text("Favorite")
                                    Image(systemName: "star")
                                }
                            }
                        }
                        .onTapGesture {
                            self.selectedRestaurant = restaurant
                        }
                }
                .onDelete { (indexSet) in
                    self.restaurants.remove(atOffsets: indexSet)
                }
                
            }
            .navigationTitle("Restaurant")
            .toolbar{
                Button(action : {
                    self.showSettings = true
                }, label: {
                    Image(systemName: "gear")
                        .font(.title)
                        .foregroundColor(.black)
                })
            }
            .sheet(isPresented: $showSettings) {
                //                SettingView(settingStore: SettingDataStore())
                SettingView().environmentObject(self.settingStore)
                    .presentationDetents([.medium, .large])
                    .presentationDragIndicator(.automatic)
            }
        }
    }
    //__________________FUNC___________________
    
    private func delete(item restaurant: RestaurantModel) {
        if let index = self.restaurants.firstIndex(where: { $0.id == restaurant.id }) {
            self.restaurants.remove(at: index)
        }
    }
    
    private func setFavorite(item restaurant: RestaurantModel) {
        if let index = self.restaurants.firstIndex(where: { $0.id == restaurant.id }) {
            self.restaurants[index].isFavorite.toggle()
        }
    }
    
    private func checkIn(item restaurant: RestaurantModel) {
        if let index = self.restaurants.firstIndex(where: { $0.id == restaurant.id }) {
            self.restaurants[index].isCheckIn.toggle()
        }
    }
    
    //레스토랑 객체를 받아 해당 레스토랑을 표시할지 여부를 호출자에게 안내.
    private func shouldShowItem(restaurant : RestaurantModel) -> Bool{
        return (!self.settingStore.showCheckInOnly || restaurant.isCheckIn) && (restaurant.priceLevel <= self.settingStore.maxPriceLevel)
    }
    
    //_____________________________FUNC END__________________________
}


