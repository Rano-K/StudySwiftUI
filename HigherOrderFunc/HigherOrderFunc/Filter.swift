//
//  Filter.swift
//  HigherOrderFunc
//
//  Created by ms k on 8/5/24.
//
//문제 1. numbers를 10보다 큰 값만 보이도록 할 때.
///filter함수 안쓰고하는 방법
///var over10 = [Int]()

///for number in numbers {
    ///if number > 10 {
        ///over10.append(number)
    ///}
///}
import SwiftUI

struct Filter: View {
    let testers = [
        Tester(name: "seola", age: 32),
        Tester(name: "minsoo", age: 33),
        Tester(name: "younseok", age: 30),
        Tester(name: "sungmin", age: 30),
        Tester(name: "taekgyu", age: 34),
        Tester(name: "jungwon", age: 29)
    ]
    
    @State var showTester = [String : Int]()
    @State var showTesterName = [String]()
    @State var showTesterAge = [Int]()
    
    let numbers = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 53, 59, 61, 67]
    @State var overTen = [Int]()
    @State var findtester = [String]()

    var body: some View {
        VStack{
            VStack(spacing: 30){
                HStack(alignment: .firstTextBaseline){
                    Text("기본숫자")
                    Text("\(numbers)")
                }
                //예제 1. numbers에 대한 filtering
                HStack(alignment: .firstTextBaseline){
                    Button {
//                        overTen = numbers.filter { (number) -> Bool in
//                            return number > 10
//                        }
//                        overTen = numbers.filter({
//                            return $0>10
//                        })
                        overTen = numbers.filter({
                            $0 > 10
                        })
                    } label: {
                        Text("10넘는 수만 출력")
                    }
                    Text("\(overTen)")
                }
                
                Divider()
                
                //예제2. Tester를 특정조건에 따라 filtering하기
                HStack(alignment: .firstTextBaseline){
                    Text("기본 테스터 인원들")
                    Button {
                        let showName = testers.map {
                            $0.name
                        }
                        print(showName)
                        let showAge = testers.map {
                            $0.age
                        }
                        print(showAge)
                        showTesterAge = showAge
                        showTesterName = showName

//                        showTester.map { _ in (showName, showAge) }
                        
                    } label: {
                        Text("show")
                    }
                }
                VStack(alignment: .leading){
                    Text("Name : \(showTesterName)")
                    Text("Age : \(showTesterAge)")
                }
                .padding(30)
            }
                
                
                
                
                
                HStack(alignment : .firstTextBaseline){
                    Button {
                        let results = testers.filter {
                            $0.name.prefix(1) == "s" && $0.age >= 30
                        }
                        print("filter된 인원 : \(results.count)")
                        
                        if findtester.isEmpty{
                            for i in results{
                                findtester.append(i.name)
                            }
                        }else{
                            print("Already Exist")
                        }
                        
                    } label: {
                        Text("Tester중에서 이름이 s로 시작하고 나이가 30세 이상 찾기")
                    }
                    Text("\(findtester)")
                }
                
                
            
        }
    
    }
}

