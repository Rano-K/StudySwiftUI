//
//  SettingView.swift
//  14_DataSharing
//
//  Created by ms k on 5/7/24.
//

import SwiftUI

struct SettingView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
//    private var displayOrders = [ "Alphabetical", "Show Favorite First", "Show Check-in First"]
    
//    @State private var selectedOrder = 0
    @State private var selectedOrder = RestaurantEnumModel.alphabetical
    @State private var showCheckInOnly = false
    @State private var maxPriceLevel = 4
    
    //DataStore 사용하기위해 선언.
    //DataStore를 ObservableObject로 선언했기 때문에 EnvironmentObject로 가져와서 사용한다.
    @EnvironmentObject var settingStore : SettingDataStore
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("SORT PREFERENCE")) {
//                    Picker(selection: $selectedOrder, label: Text("Display order")) {
//                        ForEach(0 ..< displayOrders.count, id: \.self) {
//                            Text(self.displayOrders[$0])
//                        }
//                    }

                    //enum사용
                    Picker(selection: $selectedOrder, label: Text("Display order")){
                        ForEach(RestaurantEnumModel.allCases, id: \.self) {orderType in
                            Text(orderType.text)
                        }
                    }
                    .onChange(of: selectedOrder, {
                            print(selectedOrder.text)
                    })
                }
                
                Section(header: Text("FILTER PREFERENCE")) {
                    Toggle(isOn: $showCheckInOnly) {
                        Text("Show Check-in Only")
                    }
                    .onTapGesture {
                        showCheckInOnly ? print("showCheckInOnly Off") : print("shwoCheckInOnly ON")
                    }
                    
                    Stepper(onIncrement: {
                        self.maxPriceLevel += 1
                        print(maxPriceLevel)
                        
                        if self.maxPriceLevel > 5 {
                            self.maxPriceLevel = 5
                        }
                    }, onDecrement: {
                        self.maxPriceLevel -= 1
                        print(maxPriceLevel)
                        
                        if self.maxPriceLevel < 1 {
                            self.maxPriceLevel = 1
                        }
                    }) {
                        Text("Show \(String(repeating: "$", count: maxPriceLevel)) or below")
                    }
                }
            }
            .navigationBarTitle("Settings")
            .navigationBarItems(
                leading:
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Cancel")
                            .foregroundColor(.black)
                    }),
                
                trailing:

//                Button(action: {
//                    self.presentationMode.wrappedValue.dismiss()
//                }, label: {
//                    Text("Save")
//                        .foregroundColor(.black)
//                })
                    //버튼눌렀을 때 데이터 저장하기
                    Button(action: {
                        //settingStore이라고 plist에 만들어 둔 곳에 해당 내용들이 저장된다.
                        self.settingStore.displayOrder = self.selectedOrder
                        print(selectedOrder)
                        self.settingStore.showCheckInOnly = self.showCheckInOnly
                        print(showCheckInOnly)
                        self.settingStore.maxPriceLevel = self.maxPriceLevel
                        print(maxPriceLevel)
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Save")
                    })
                        .foregroundStyle(.black)
            )
            
        }//NavigationView
        .onAppear{
            self.selectedOrder = self.settingStore.displayOrder
            self.showCheckInOnly = self.settingStore.showCheckInOnly
            self.maxPriceLevel = self.settingStore.maxPriceLevel
        }
        
    }
    
}
