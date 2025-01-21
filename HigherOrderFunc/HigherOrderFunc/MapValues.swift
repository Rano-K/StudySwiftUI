//
//  MapValues.swift
//  HigherOrderFunc
//
//  Created by ms k on 8/3/24.
//

import SwiftUI

struct MapValues: View {
    
    var info : [String : String] = [:]

    init(info: [String: String] = [:]) {
        
        self.info["name"] = "seola"
        self.info["city"] = "gilumDong"
        self.info["job"] = "flutter developer"
        self.info["hobby"] = "kartrider"
    }

    @State var updatedInfo : [String : String] = [:]
    
    //MapCustomType
    let testers = [
        Tester(name: "seola", age: 32),
        Tester(name: "minsoo", age: 33),
        Tester(name: "younseok", age: 30),
        Tester(name: "sungmin", age: 30),
        Tester(name: "taekgyu", age: 34),
        Tester(name: "jungwon", age: 29)
    ]
    @State var testers_age : [Int] = []
    @State var testers_name : [String] = []
    
    var body: some View {
        VStack{
            HStack{
                Text("기본 정보")
                VStack(alignment: .leading){
                    ForEach(info.keys.sorted(),id: \.self){ key in
                        if let value = info[key]{
                            Text("\(key) : \(value)")
                        }
                    }
                }
                
            }
            .padding(.bottom, 20)
            
            
            Button {
                let updated = info.mapValues { $0.capitalized }
                updatedInfo = updated
            } label: {
                Text("capitalizedButton")
            }
            Text("\(updatedInfo)")
            
            Button {
                let age = testers.map { $0.age }
                let name = testers.map { $0.name}
                
                testers_age = age
                testers_name = name
                print(testers_age)
            } label: {
                Text("show only name, only ages")
            }
            Text("Only Age: \(testers_age)")
            Text("Only Name: \(testers_name)")


        }
    }
}

