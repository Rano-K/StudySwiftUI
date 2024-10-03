//
//  CardView.swift
//  20_Animation(AppleWallet)_Transition
//
//  Created by ms k on 7/3/24.
//

import SwiftUI

struct CardView: View {
    
    var card : Card
    
    var body: some View {
        Image(card.image)
            .resizable()
            .scaledToFit()
            .overlay(alignment: .bottomLeading, content: {
                VStack(alignment: .leading, content: {
                    Text(card.number)
                        .bold()
                    
                    HStack{
                        Text(card.name)
                            .bold()
                        Text("Valid Thru")
                            .font(.footnote)
                        Text(card.expiryDate)
                            .font(.footnote)
                    }
                    .foregroundStyle(.white)
                    .padding(.leading, 25)
                    .padding(.bottom, 20)
                })
            })
            .shadow(color: .gray, radius: 1.0, x: 0.0, y: 1.0)
    }
}

#Preview (testCards[0].type.rawValue){
    CardView(card: testCards[0])
}
