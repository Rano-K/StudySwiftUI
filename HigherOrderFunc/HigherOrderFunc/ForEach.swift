//
//  ForEach.swift
//  HigherOrderFunc
//
//  Created by ms k on 8/16/24.
//

import SwiftUI

struct ForEachView: View {
    
    //예제1
    let numbers = [2, 5, 3, 9, 15, 12, 8, 17, 20, 11]
    @State var evenOdd1 = [String]()
    @State var evenOdd2 = [String]()
    
    //예제2
    let numbersWithNil = [5, 15, nil, 3, 9, 12, nil, nil, 17, nil]
    @State var evenOddNil1 = [String]()
    @State var evenOddNil2 = [String]()
    
    var body: some View {
        VStack(alignment: .leading, content: {
            //예제1.
            //evenOdd를 for...in 문으로 만들기
            HStack{
                Button {
                    if evenOdd1.isEmpty{
                        for number in numbers {
                            if number.isMultiple(of: 2){
                                print("\(number) is even")
                                evenOdd1.append("\(number) is even\n")
                            }else{
                                print("\(number) is odd")
                                evenOdd1.append("\(number) is odd\n")
                            }
                        }
                    }
                } label: {
                    Text("홀수짝수 구분")
                }.padding(.trailing, 5)
                //clean버튼
                Button {
                    if !evenOdd1.isEmpty{
                        evenOdd1 = []
                    }
                } label: {
                    Text("clean")
                }

            }
            
            Text(evenOdd1.joined())
                .padding(.bottom, 20)
            
            //evenOdd를 forEach문으로 만들기
            HStack{
                Button {
//                    numbers.forEach { (number) in
//                        if number.isMultiple(of: 2){
//                            evenOdd2.append("\(number) is even\n")
//                        }else{
//                            evenOdd2.append("\(number) is odd\n")
//                        }
//                    }
                    numbers.forEach {
                        if $0.isMultiple(of: 2){
                            evenOdd2.append("\($0) is even\n")
                        }else{
                            evenOdd2.append("\($0) is odd\n")
                        }
                    }
                } label: {
                    Text("evenOdd를 forEach문으로")
                }
                //클린버튼
                Button {
                    if !evenOdd2.isEmpty{
                        evenOdd2 = []
                    }
                } label: {
                    Text("clean")
                }
                
            }
            
            Text(evenOdd2.joined())
                .padding(.bottom, 20)
            
            //예제2.
            //for...in문을 사용, continue, break사용하기
            Button("옵셔널을 조건부로 unwrapping하기") {
                for number in numbersWithNil{
                    guard let number = number else{
                        evenOddNil1.append("Found nil \n")
                        continue
                    }
                    evenOddNil1.append("The double of \(number) is \(number * 2)\n")
                }
            }
            Text(evenOddNil1.joined())
            
            //ForEach문을 이용, return 사용해 nil넘어가기
            Button("ForEach문사용") {
                numbersWithNil.forEach {(number) in
                    guard let number = number else{
                        evenOddNil2.append("Found Nil\n")
                        return
                    }
                    evenOddNil2.append("The Double of \(number) is \(number * 2)\n")
                }
            }
            Text(evenOddNil2.joined())


        })
    }
}
