//
//  Map_Dictionaries.swift
//  HigherOrderFunc
//
//  Created by ms k on 8/2/24.
//

import SwiftUI
///**self**
///self는 "모든 인스턴스들이 암시적으로 생성하는 프로퍼티"
///자기 자신을 가리키는 프로퍼티.
///java의 this
///역할1 : 인스턴스 내부에 같은 이름으로 선언된 변수가 있다면 좀 더 명확하게 명시해줄 수 있음.
///     class PersonA{
///         var name : String
///         init(name: String) {
///              self.name = name
///         }
///     }
///     여기서 init내부에 있는 name은 지역변수, 매개변수, 인스턴스 프로퍼티 순으로 무엇을 지칭하는지 찾는다.
///     이 때 인스턴스 프로퍼티로 지정해주기 위해 self를 사용한다.
///

    

struct Map_Dictionaries: View {
    
    var info : [String : String] = [:]

    init(info: [String: String] = [:]) {
        
        self.info["name"] = "seola"
        self.info["city"] = "gilumDong"
        self.info["job"] = "flutter developer"
        self.info["hobby"] = "kartrider"
    }
    
    @State var newInfo : [String:String] = [:]
    @State var newInfo_UpperCase : [String : String] = [:]
    
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("info :")
                    .foregroundStyle(.red)
                Text("\(info)")
            }
            Divider()
            HStack{
                Text("info.keys :")
                    .foregroundStyle(.red)
                Text("\(info.keys)")
            }
            Divider()
            HStack{
                Text("info.values")
                    .foregroundStyle(.red)
                Text("\(info.values)")
            }
            Divider()
            HStack{
                Text("info.map{$0} :")
                    .foregroundStyle(.red)
                Text("\(info.map{ $0 })")
            }
            Divider()
            
            Button {
                let result = info.map { $0 }
                newInfo = Dictionary(uniqueKeysWithValues: result)
            } label: {
                Text("save info into result")
            }
            HStack{
                Text("newInfo :")
                    .foregroundStyle(.red)
                Text("\(newInfo)")
            }
            
            Button {
//                let updatedKeysAndValues = info.map {($0.key.uppercased(), $0.value.capitalized)}
                let updatedKeysAndValues = info.map{ ($0.uppercased(), $1.capitalized)}
                newInfo_UpperCase = Dictionary(uniqueKeysWithValues: updatedKeysAndValues)
            } label: {
                Text("newInfo_UpperCase")
            }
            HStack{
                Text("newInfo_UpperCase :")
                Text("\(newInfo_UpperCase)")
            }
        }
    }
}
