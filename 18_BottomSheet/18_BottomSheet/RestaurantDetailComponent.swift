//
//  RestaurantDetailComponent.swift
//  18_BottomSheet
//
//  Created by ms k on 6/20/24.
//

import SwiftUI

struct HandleBar : View {
    var body: some View {
        Rectangle()
            .frame(width: 50, height: 5 )
            .foregroundStyle(Color(.systemGray5))
            .cornerRadius(10)
    }
}

struct TitleBar : View {
    var body: some View {
        HStack{
            Text("Restaurant Details")
                .font(.headline)
                .foregroundStyle(.primary)
            Spacer()//왼쪽으로 정렬하기 위해 사용
        }
        .padding()
    }
}

///Header View 는 이미지 뷰, 두개의 텍스트 뷰로 구성
///텍스트 뷰는 이미지 뷰 위에 overlay될 예정
struct HeaderView : View {
    
    let restaurantModel : RestaurantModel
    
    var body: some View {
        Image(restaurantModel.image)
            .resizable()
            .scaledToFill()
            .frame(height: 300)
            .clipped()
            .overlay(
                HStack{
                    VStack(alignment: .leading){
                        Spacer()
                        Text(restaurantModel.name)
                            .foregroundStyle(.white)
                            .font(.system(.largeTitle, design: .rounded))
                            .bold()
                        Text(restaurantModel.type)
                            .font(.system(.headline, design: .rounded))
                            .padding(5)
                            .foregroundStyle(.white)
                            .background(Color.red)
                            .cornerRadius(5)
                    }
                    Spacer()
                }
                    .padding()
            )
    }
}

//Detail info View
struct DetailInfoView : View {
    
    let icon : String?
    let info : String
    
    var body: some View {
        HStack{
            if icon != nil{
                Image(systemName: icon!)
                    .padding(.trailing, 10)
            }
            Text(info)
                .font(.system(.body, design: .rounded))
            Spacer()
        }
        .padding(.horizontal)
    }
}

