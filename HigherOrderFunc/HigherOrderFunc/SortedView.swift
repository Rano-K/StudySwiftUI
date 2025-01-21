//
//  SrotedView.swift
//  HigherOrderFunc
//
//  Created by ms k on 8/17/24.
//

import SwiftUI

struct SortedView: View {
    
    var toSort = [5,3,8,2,10]
    @State var toSorted = [Int]()
    @State var toSortedBy = [Int]()
    
    //예제3
    let temperatures = ["London": 7, "Athens": 14, "New York": 15, "Cairo": 19, "Sydney": 28]
    @State var isTemperatures : [(String, Int)] = []
    @State var isTemper : [String : Int] = [:]
    
    var body: some View {
        VStack{
            HStack{
                ForEach(toSort, id: \.self){
                    Text("\($0)")
                }
            }
            //예제1. sorted배열 정렬하기
            HStack{
                Button("내림차순 정렬하기"){
                    let sorted = toSort.sorted{
                        $0 > $1
                    }
                    if toSorted.isEmpty{
                        toSorted.append(contentsOf: sorted)
                    }else{
                        toSorted = sorted
                    }
                    
                }
                Button("오름차순 정렬하기"){
                    let sorted = toSort.sorted{
                        $0 < $1
                    }
                    if toSorted.isEmpty{
                        toSorted.append(contentsOf: sorted)
                    }else{
                        toSorted = sorted
                    }
                }
            }
            HStack{
                ForEach(toSorted, id: \.self){
                    Text("\($0)")
                }
            }
            .padding(.bottom, 20)
            
            //예제2. sorted(by:) 정렬하기
            HStack{
                Button("sorted(by:) 내림차순"){
                    let sorted = toSort.sorted(by: <)
                    if toSortedBy.isEmpty{
                        toSortedBy.append(contentsOf: sorted)
                    }else{
                        toSortedBy = sorted
                    }
                }
                Button("sorted(by:) 오름차순"){
                    let sorted = toSort.sorted(by: >)
                    if toSortedBy.isEmpty{
                        toSortedBy.append(contentsOf: sorted)
                    }else{
                        toSortedBy = sorted
                    }
                }
            }
            
            HStack{
                ForEach(toSortedBy, id: \.self){
                    Text("\($0)")
                }
            }
            .padding(.bottom, 20)
            
            //예제3. 도시와 온도를 정렬
            Button("도시, 온도 정렬") {
                let sortedTemperatures = temperatures.sorted{
                    $0.value > $1.value
                }
                let sortedTemperaturesDict = Dictionary(uniqueKeysWithValues: sortedTemperatures)
                isTemper = sortedTemperaturesDict
                isTemperatures = sortedTemperatures
            }
            ForEach(isTemperatures, id: \.0){city, temper in
                Text("\(city), \(temper)")
            }
            
            Text("Dict : \(isTemper)")
        }
    }
}

