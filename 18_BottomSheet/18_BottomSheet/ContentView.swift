//
//  ContentView.swift
//  18_BottomSheet
//
//  Created by ms k on 6/20/24.
//

import SwiftUI

struct ContentView: View {
    
    //선택된 레스토랑 표시
    @State private var selectedRestaurant : RestaurantModel?
    
    //선택한 bottom sheet의 Detents저장하기
    @State private var selectedDetent : PresentationDetent = .medium
    
    var body: some View {
        NavigationStack{
            
            List{
                ForEach(restaurantsModel) {restaurant in
                    RestaurantViewModel(restaurant : restaurant)
                        .onTapGesture {
                            self.selectedRestaurant = restaurant

                            print(restaurant.image)
                            print(restaurant.location)
                            print(restaurant.name)
                            
                        }
                }
            }
            .navigationTitle("Restaurant")
            .listStyle(.plain)
        }
        .sheet(item: $selectedRestaurant){restaurant in
            RestaurantDetailView(restaurantModel: restaurant)
                .ignoresSafeArea()
                .presentationDetents([.large, .medium, .fraction(0.1), .height(200)], selection: $selectedDetent)
                .presentationDragIndicator(.hidden)
        }
//        VStack {
//            Button("Show bottom sheet") {
//                showSheet.toggle()
//            }
//            .buttonStyle(.borderedProminent)
//            .sheet(isPresented: $showSheet) {
//                Text("Expandable Bottom Sheet")
//                    .presentationDetents([.fraction(0.1), .fraction(0.2), .fraction(0.3), .fraction(0.4), .fraction(0.5), .fraction(0.6), .fraction(0.7), .fraction(0.8), .fraction(0.9), .fraction(1.0)])
//            }
//            Spacer()
//        }
    }
}



