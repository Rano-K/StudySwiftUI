//
//  Reduce.swift
//  HigherOrderFunc
//
//  Created by ms k on 8/6/24.
//

import SwiftUI

struct Reduce: View {
    
    //예제1.
    var numbers_Array = [5,3,8,4,2]
    @State var showNumber = [Int]()
    @State var showNum_reduce : Int = 0
    @State var showNum_reduce2 : Int = 0
    
    //예제2.
    let friendsAndMoney = ["Alex": 150.00, "Tim": 62.50, "Alice": 79.80, "Jane": 102.00, "Bob": 94.20]
    @State var friend_Money : Double = 0

    
    //함수 실행되는데 걸리는 시간 측정
    var clock = ContinuousClock()
    
    var body: some View {
        VStack(spacing: 30){
            //reduce를 사용하지 않고 for-in루프로 배열 내 숫자를 곱하기
            VStack{
                Button {
                    var product = 1
                    let timeNotUsingReduce = clock.measure {
                        for number in numbers_Array{
                            product *= number
                        }
                    }
                    
                    showNumber.append(product)
                    print(timeNotUsingReduce)
                    
                } label: {
                    Text("Multiply not using reduce ")
                }
                Text("\(showNumber)")
            }
            
            
            //reduce사용법
            VStack{
                Button {
                    let timeUsingReduce = clock.measure {
                        let product = numbers_Array.reduce(1){ (partialResult, number) -> Int in
                            return partialResult * number
                        }
                        showNum_reduce = product
                        print(product)
                    }
                    print(timeUsingReduce)
                    
                    
                } label: {
                    Text("reduce 사용")
                }
                if showNum_reduce != 0 {
                    Text("\(showNum_reduce)")
                }
            }
            
            //reduce를 축약인수를 사용해 계산하기
            VStack{
                Button {
//                    let product = numbers_Array.reduce(1, {$0 * $1})
                    let product = numbers_Array.reduce(1, *)
                    showNum_reduce2 = product
                    
                } label: {
                    Text("Reduce축약인수 사용")
                }
                Text("\(showNum_reduce2)")
            }
            
            Divider()
                .frame(height: 10)
                .foregroundStyle(.black)
            
            
            VStack{
                Button {
                    let allMoney = friendsAndMoney.reduce(0, {$0 + $1.value})
                    friend_Money = allMoney
                } label: {
                    Text("돈합치기")
                }
                Text("합친돈의 액수 : \(friend_Money)")
                    

            }
            
            
        }
    }
    //추론?
//    func sumOfSquare(closure : (Double -> Double), numbers : Double...) -> Double{
//        var result : Double = Double()
//        for number in numbers
//    }
}
