//
//  propertyTest.swift
//  14_DataSharing
//
//  Created by ms k on 5/12/24.
//

import SwiftUI
struct propertyTest: View {
    
    
    
    var body: some View {
        VStack{
            Text("test")
            Text("storedTypeProperty : \(SomeClass.storedTypeProperty)")
            Text("computedTypeProperty : \(SomeClass.computedTypeProperty)")
            Text("class : \(SomeClass.overrideAbleComputedTypeProperty)")
            Text("childClass : \(ChildSomeClass.overrideAbleComputedTypeProperty)")
            Divider()
            Text("TypeProperty : \(AClass.typeProperty)")
            Text("TypeComputedProperty : \(AClass.typeComputedProperty)")
            Text("연산된 프로퍼티1 :\(AClass.typeProperty = 1234)")
            Text("연산된 프로퍼티2 :\(AClass.typeProperty)")
            
        }
    }
}

class SomeClass{
    static var storedTypeProperty = "Some View"
    static var computedTypeProperty : Int {
        return 10
    }
     
    class var overrideAbleComputedTypeProperty : Int {
        return 200
    }
}

class ChildSomeClass : SomeClass {
    override static var overrideAbleComputedTypeProperty: Int{
        return 233
    }
}

class AClass {
    //저장 타입 프로퍼티
    static var typeProperty : Int = 0
    
    //저장 인스턴스 프로퍼티
    var instanceProperty : Int = 0 {
        didSet{
            //self.typePropert == AClass.typeProperty
            Self.typeProperty = instanceProperty + 10
        }
    }
    
    //연산 타입 프로퍼티
    static var typeComputedProperty : Int{
        get{
            return typeProperty
        }
        set{
            typeProperty = newValue
        }
    }
}







