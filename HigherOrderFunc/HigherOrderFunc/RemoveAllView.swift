//
//  RemoveAllView.swift
//  HigherOrderFunc
//
//  Created by ms k on 8/16/24.
//

import SwiftUI

struct RemoveAllView: View {
    
    @State var numbers = [2, 5, 3, 9, 15, 12, 8, 17, 20, 21]
//    @State var resultNum1 = [Int]()
    
    @State var strings = ["a", "e", "i", "o", "u"]

    var body: some View {
        VStack{
            Text(numbers.map{String($0)}.joined(separator: ","))
            Button("10보다 작은 수 제거하고 출력") {
                numbers.removeAll{(number) -> Bool in
                    return number < 10 //10보다 작은수 removeAll
                }
//                resultNum1.append(contentsOf: numbers)
            }
            .padding(.bottom, 20)
            
            Button("축약인수 사용, 10보다 큰 수 제거") {
                numbers.removeAll{
                    $0 > 10 // 10보다 큰 수 removeAll
                }
            }
            // 위의 두가지 버튼 적용시 배열내 모든 항목이 제거된다.
            // View도 빈 배열이 있을 공간조차 없앤다.
            Text(strings.joined(separator: ","))
            Button("특정 string지우기") {
                strings.removeAll{
                    $0.contains("a")
                }
            }
        }
    }
}
