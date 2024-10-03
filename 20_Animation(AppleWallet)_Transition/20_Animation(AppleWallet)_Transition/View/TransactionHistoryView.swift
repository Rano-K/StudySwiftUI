//
//  TransactionHistoryView.swift
//  20_Animation(AppleWallet)_Transition
//
//  Created by ms k on 7/3/24.
//  거래내역뷰

import SwiftUI

struct TransactionHistoryView: View {
    
    var transactions : [Transaction]
    
    var body: some View {
        VStack(alignment : .leading){
            Text("Transaction History")
                .font(.system(size: 25, weight: .black, design:  .rounded))
                .padding()
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing : 30, content: {
                    ForEach(transactions, content: {transaction in
                        TransactionView(transaction : transaction)
                    })
                })
                .padding()
            }
        }
    }
}
