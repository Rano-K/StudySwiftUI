//
//  Transaction.swift
//  20_Animation(AppleWallet)_Transition
//
//  Created by ms k on 7/2/24.
//  Transaction : 거래
/// 지갑 앱의 거래.
/// 각 거래는 고유ID, 상인, 금액, 날짜, icon을 가진다.
/// testTransactions존재.

import Foundation

struct Transaction: Identifiable {
    var id = UUID()
    var merchant: String
    var amount: Double
    var date: String
    var icon: String = "dollarsign.circle.fill"
}

let testTransactions = [
    Transaction(merchant: "Mushroom", amount: 120.0, date: "11/2/2020", icon: "star.circle.fill"),
    Transaction(merchant: "Amazon", amount: 50.0, date: "10/2/2020", icon: "cart.fill"),
    Transaction(merchant: "MUJI", amount: 300.0, date: "8/2/2020", icon: "app.gift.fill"),
    Transaction(merchant: "Apple", amount: 800.0, date: "4/2/2020", icon: "headphones"),
    Transaction(merchant: "Netflix", amount: 19.0, date: "11/2/2020", icon: "tv"),
    Transaction(merchant: "ANA", amount: 480.0, date: "11/2/2020", icon: "airplane")
]

