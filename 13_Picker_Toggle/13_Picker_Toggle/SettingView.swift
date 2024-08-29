//
//  SettingView.swift
//  13_Picker_Toggle
//
//  Created by ms k on 5/1/24.
//

import SwiftUI

struct SettingView: View {
    
    private var displayOrders = ["Alphabetical", "Show Favorite First", "Show check-in First"] //선택할 옵션들
    @State private var selectedOrder = 0 //사용자의 선택을 저장할 상태변수 for picker
    @State private var showCheckInToggle = false // 체크인 항목 표시 for toggle
    @State private var maxPriceLevel = 5 //Stepper에서 사용할 MaxLevel
    //test
    @State private var testValue = 10.0
    @State private var age = 30
    
    //ColorTestSection
    @State private var value = 0
    let Colors : [Color] = [.orange, .red, .green, .gray, .blue, .purple, .pink]
    
    
    var body: some View {
        NavigationStack{
            Form {
                
                //Picker Section
                Section(header: Text("SORT PREFERENCE")) {
                    /// picker 에서 selectedOrder를 선택인자로 사용( 그저 0, 1, 2)
                    /// ForEachdksdp displayOrders배열의 순서를 id로 사용
                    Picker(selection: $selectedOrder, label: Text("Display Order")){
                        ForEach(0 ..< displayOrders.count, id: \.self){
                            Text(self.displayOrders[$0])
                        }
                    }
                    .onChange(of: selectedOrder){
                        if selectedOrder == 0{
                            print(displayOrders[0])
                        }else if selectedOrder == 1{
                            print(displayOrders[1])
                        }else{
                            print(displayOrders[2])
                        }
                    }
                }
                .pickerStyle(.automatic)
                
                //Toggle Section
                Section(header: Text("FILTER PREFERENCE")) {
                    Toggle(isOn: $showCheckInToggle) {
                        Text("Show Check-In")
                    }
                    .onChange(of: showCheckInToggle){
                        if showCheckInToggle{
                            print("On")
                        }else{
                            print("Off")
                        }
                    }
                    //Stepper Section
                    Stepper(onIncrement:{
                        self.maxPriceLevel += 1
                        if self.maxPriceLevel > 5{
                            self.maxPriceLevel = 5
                        }
                    }, onDecrement: {
                        self.maxPriceLevel -= 1
                        if self.maxPriceLevel < 1 {
                            self.maxPriceLevel = 1
                        }
                    }) {
                        Text("Show \(String(repeating: "$", count: maxPriceLevel)) or below")
                    }
                    
                    
//                    Stepper(value: $testValue, in: 1...20, step: Double.Stride(0.5)){
//                        Text("\(testValue, specifier: "%g") hours")
//                    }
                    Stepper(value: $testValue, in: 1...20, step: 0.5){
                        Text("\(testValue, specifier: "%g") hours")
                    }
                    
                    Stepper(value: $age, in: 1...100, step : 1){
                        Text("\(age) age")
                    }
                }
                
                Section(header: Text("ColorTestPart")){
                    Stepper(onIncrement: incrementStep, onDecrement: decrementStep){
                        Text("값 : \(value + 1) 색상 : \(Colors[value].description)")
                            .foregroundStyle(Colors[value])
                    }
                }
            }
            .navigationBarTitle("Settings")
        }
        
    }
    //func
    //ColorTestFunc
    func incrementStep(){
        value += 1
        if value >= Colors.count {
            value = 0
        }
    }
    func decrementStep(){
        value -= 1
        if value < 0{
            value = Colors.count - 1
        }
    }
}

