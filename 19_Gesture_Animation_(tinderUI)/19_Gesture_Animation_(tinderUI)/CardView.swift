//
//  CardView.swift
//  19_Gesture_Animation_(tinderUI)
//
//  Created by ms k on 6/27/24.
//

import SwiftUI

//배열의 각 항목을 고유하게 식별하는 방법? Identifiable로 선언
struct CardView: View, Identifiable{
    //
    let id = UUID()
    //데이터를 저장할 image, title변수 선언
    let image : String
    let title : String
    
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFill()
            .frame(minWidth: 0, maxWidth: .infinity)
            .cornerRadius(10)
            .padding(.horizontal, 15)
            .overlay(alignment: .bottom){
                //Content
                VStack{
                    Text(title)
                        .font(.system(.headline, design: .rounded))
                        .fontWeight(.bold)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 10)
                        .background(.white)
                        .cornerRadius(5)
                }
                .padding([.bottom], 20)
            }
    }
}

#Preview {
    CardView(image: "yosemite-usa", title: "Yosemite, USA")
}
