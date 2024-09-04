//
//  ContentView.swift
//  16_SwipeDelete_ContextMenu_ActionSheets
//
//  Created by ms k on 6/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var restaurants = [ Restaurant(name: "Cafe Deadend", image: "cafedeadend"),
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
    
    //confirmationDialog용
    @State var showAlert = false
    @State var selectedRestaurant : Restaurant?
    @State var isCheckIn = false
    
    var body: some View {
        List{
            ForEach(restaurants) {restaurant in
                Restaurant_ViewModel(restaurant: restaurant)
                    .contextMenu(ContextMenu(menuItems: {
                        //삭제버튼 start
                        Button(action: {
                            //선택된 레스토랑 삭제
                            self.delete(item : restaurant)
                        }){
                            HStack{
                                Text("삭제")
                                Image(systemName: "trash")
                            }
                        }
                        //삭제 버튼 end
                        //즐겨찾기 버튼 start
                        Button(action : {
                            //선택된 레스토랑 즐겨찾기
                            self.setFavorite(item : restaurant)
                        }){
                            HStack{
                                Text("즐겨찾기")
                                Image(systemName: "star")
                            }
                        }
                        //즐겨찾기 버튼 end
                        //체크인 여부 버튼 START
                        Button(action : {
                            self.setCheckIn(item: restaurant)
                        }){
                            HStack{
                                Text("방문여부")
                                Image(systemName: "checkmark.seal.fill")
                            }
                        }
                        
                        
                        //체크인 여부 버튼 END
                    }))//contextMenu
                    .onTapGesture {
                        self.showAlert.toggle()
                        self.selectedRestaurant = restaurant//클릭했을 때 selectedRestaurant에는 Foreach의 restaurant가 들어가게 된다.
                        
                    }
                    .confirmationDialog("\(self.selectedRestaurant?.name ?? "not selected")",
                                        isPresented: self.$showAlert,
                                        titleVisibility: .visible,
                                        actions: {
                        
                        Button("삭제"){
                            if let selectedRestaurant = self.selectedRestaurant{
                                self.delete(item: selectedRestaurant)
                            }
                        }
                        Button("즐겨찾기"){
                            if let selectedRestaurant = self.selectedRestaurant{
                                self.setFavorite(item: selectedRestaurant)
                            }
                        }
                        Button(self.selectedRestaurant?.isCheckIn == true ? "방문취소하시겠습니까?" : "방문하셨나요?"){
                            if let selectedRestaurant = self.selectedRestaurant{
                                self.setCheckIn(item: selectedRestaurant)
                            }
                        }
                        
                    })
            }
            .onDelete{ (indexSet) in
                self.restaurants.remove(atOffsets: indexSet)
            }
        }
        .listStyle(.plain)
    }
    
    //FUNCTION
    ///ContextMenu에서 사용할 Delete액션은
    ///onDelete액션과는 달리 List에 직접할당 되어있지 않기 때문에
    ///index를 알아내기 위해서는 ContentView에 새로운 함수를 만들어야 한다.
    private func delete(item restaurant : Restaurant){
        if let index = self.restaurants.firstIndex(where: {$0.id == restaurant.id}){
            self.restaurants.remove(at: index)
        }
    }
    
    ///즐겨찾기 버튼을 구현하려면 RestaurantModel을 수정해야한다.
    ///1. isFavorite 속성을 추가해야 한다. => 즐겨찾기 버튼이 표시되었는지 여부. 기본값은 false
    ///
    private func setFavorite(item restaurant: Restaurant){
        if let index = self.restaurants.firstIndex(where: {$0.id == restaurant.id}){
            self.restaurants[index].isFavorite.toggle()//toggle()
        }
    }
    ///confiramationDialog를 띄울 function생성
    ///1. @State로 선언된 showAlert에 의해 띄울 것. Action상태를 false->true로 바뀔 때 변경되게끔
    ///2. @State로 선언된 selectedRestaurant에 선택된 restaurant을 저장.
    ///** State로 선언됨으로써 showAlert, selectedRestaurant가 실시간으로 UI에 반영이 된다.
    
    ///SET CHECK-IN FUNCTION
    private func setCheckIn(item restaurant : Restaurant){
        if let index = self.restaurants.firstIndex(where: {$0.id == restaurant.id}){
            self.restaurants[index].isCheckIn.toggle()
        }
    }
    
}

