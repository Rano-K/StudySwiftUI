//
//  Card.swift
//  20_Animation(AppleWallet)_Transition
//
//  Created by ms k on 7/3/24.
/// 카드 구조체
/// 카드번호, 종류, 만료날짜, 이미지, 고객이름 등이 포함
/// testCards배열 존재
/// 

import Foundation

enum CardType : String{
    case visa
    case master
    case ae
    case chase
    case discover
}

struct Card : Identifiable{
    var id = UUID()
    var name : String
    var type : CardType
    var number : String
    var expiryDate : String
    var image : String{
        return type.rawValue
    }
}

let testCards = [ Card(name: "James Hayward", type: .visa, number: "4242 4242 4242 4242", expiryDate: "3/23"),
              Card(name: "Cassie Emily", type: .master, number: "5353 5353 5353 5353", expiryDate: "10/21"),
              Card(name: "Adam Green", type: .ae, number: "3737 3737 3737 3737", expiryDate: "8/22"),
              Card(name: "Donald Wayne", type: .chase, number: "6363 6263 6362 6111", expiryDate: "11/23"),
              Card(name: "Gloria Jane", type: .discover, number: "6011 0009 9013 9424", expiryDate: "5/24")
    ]
