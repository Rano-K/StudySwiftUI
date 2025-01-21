//
//  ContentView.swift
//  HigherOrderFunc
//
//  Created by ms k on 8/2/24.
//

import SwiftUI

struct ContentView: View {
    
    //문제1 : numbers배열을 2배하여 저장하기
    var numbers = [2,5,3,9,15,12,8,17,20,21]
    @State var double_ForIn : [Int] = []
    @State var double_Map : [Int] = []
    //문제2 : degrees를 radian으로 바꿔라.
    var degrees = [20,45,160,360,84,215,178,185]
    @State var to_radian_map : [Double] = []
    @State var to_radian_notMap : [Double] = []
    
    var body: some View {
        //문제1번
        VStack{
            //1번 for in 문 사용
            Button(action: {
                for i in numbers{
                    double_ForIn.append(i * 2)
                }
            }, label: {
                Text("Double_ForIn")
            })
            Text("\(double_ForIn)")
            
            //2번 map사용
            //map함수는 새로운 컬렉션을 반환한다. -> 정수 값의 배열을 반환하며 double_Map에 할당할예정
            Button(action: {
                let double = numbers.map {
                    $0 * 2
                    //$0 : 축약인수, 원본 컬렉션(numbers)의 어떤 요소든 일반적으로 참조할 수 있는 방법.
                }
                double_Map = double
            }, label: {
                Text("double_Map")
            })
            Text("\(double_Map)")
        }
        
        Divider()
        
        //문제2
        VStack{
            Button(action: {
                let radians = degrees.map {
                    Double($0) * Double.pi / 180.0
                }
                to_radian_map = radians
            }, label: {
                Text("Radian_Map")
            })
            Text("\(to_radian_map)")
            
            Button(action: {
                for degree in degrees {
                    to_radian_notMap.append(Double(degree) * Double.pi / 180.0)
                }
            }, label: {
                Text("Button_NotMap")
            })
            Text("\(to_radian_notMap)")
            
        }
    }
}
