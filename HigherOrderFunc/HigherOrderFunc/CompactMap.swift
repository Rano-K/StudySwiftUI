//
//  CompactMap.swift
//  HigherOrderFunc
//
//  Created by ms k on 8/5/24.
//

import SwiftUI

struct CompactMap: View {
    
    let numbers_nil = [5, 15, nil, 3, 9, 12, nil, nil, 17, nil] //nil값 존재
    
    @State var showNumbers_map : [Int?] = []
    @State var showNumbers_compactMap : [Int] = []
    
    var body: some View {
        VStack{
            Button {
//                let doubleNums = numbers_nil.map {
//                    $0 * 2 //이렇게 하면 $0인수는 nil값을 가질 수 있어 두배를 할 수 없는 것이 없어 에러코드 발생.
//                }
                 

                let doubleNums_map = numbers_nil.map { (number) -> Int? in
                    if let number = number{
                        return number * 2
                    }else{
                        return nil
                    }
                }
                let doubleNums_compactMap = numbers_nil.compactMap {
//                    $0 != nil ? ($0! * 2) : nil
                    $0 != nil ? $0! * 2 : 0
                }
                
                showNumbers_map = doubleNums_map
                showNumbers_compactMap = doubleNums_compactMap
                print("compactMap 언래핑",showNumbers_map)
                print("compactMap 사용시",showNumbers_compactMap)
            } label: {
                Text("numbers_nil")
            }
            Text("show map : \(showNumbers_map)")
            Text("show compactMap : \(showNumbers_compactMap)")

        }
    }
}
