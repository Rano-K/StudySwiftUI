//
//  ContainsView.swift
//  HigherOrderFunc
//
//  Created by ms k on 8/16/24.
//

import SwiftUI

struct ContainsView: View {
    
    //예제1
    let numbers = [2, 9, 11, 7, 3, 4, 15, 21, 49]
    var containsLessThan5 = false
    @State var lessThan5_1: String = ""
    @State var lessThan5_2: String = ""
    
    //예제2
    @State var staffOver40 = ""
    @State var malesOver40 = ""
    @State var malesUnder30 = ""
    
    //예제3
    let temperatures = ["London": 7, "Athens": 14, "New York": 15, "Cairo": 19, "Sydney": 28]
    @State var isTemperatures = ""
    
    var body: some View {
        VStack{
            //예제1
            VStack{
                Button("contains사용해 5보다 작은 수 판별") {
                    let hasNumberLessThan5 = numbers.contains{ (number) -> Bool in
                        return number < 5
                    }
                    if hasNumberLessThan5{
                        lessThan5_1 = "5보다 작은 수가 있습니다."
                    }else{
                        lessThan5_1 = "5보다 작은 수가 없습니다."
                    }
                }
                Text(lessThan5_1)
                
                Button("축약인수 사용하기") {
                    let hasNumberLessThan5 = numbers.contains{$0 < 5}
                    if hasNumberLessThan5{
                        lessThan5_2 = "5보다 작은수가 있습니다."
                    }else{
                        lessThan5_2 = "5보다 작은수가 없습니다."
                    }
                }
                Text(lessThan5_2)
            }
            //예제2
            VStack{
                //나이가 40이상 넘어가는 사람 있음?
                Button("hasStaffOver40") {
                    let hasStaffOver40 = staff.contains {
                        $0.age > 40
                    }
                    staffOver40 = String(hasStaffOver40)
                }
                Text(staffOver40)
                
                //남자이면서 40이상 넘어가는 사람 있음?
                Button("hasMalesOver40") {
                    let hasMalesOver40 = staff.contains(where: {
                        $0.gender == .male && $0.age > 40
                    })
                    malesOver40 = String(hasMalesOver40)
                }
                Text(malesOver40)
                
                //남자이면서 30 아래인 사람 있음?
                Button("hasMalesUnder30") {
                    let hasMalesUnder30 = staff.contains(where: {
                        $0.gender == .male && $0.age < 30
                    })
                    malesUnder30 = String(hasMalesUnder30)
                }
                Text(malesUnder30)
                
            }
            //예제3
            VStack{
                Button("온도가 25도 이상 되는 국가가 있음?") {
                    let hasHighTemperatures = temperatures.contains { $0.value > 25 }
                    if hasHighTemperatures{
                        isTemperatures = String(hasHighTemperatures)
                    }else{
                        isTemperatures = "없습니다."
                    }
                }
                Text(isTemperatures)
                
            }
        }
    }
}

