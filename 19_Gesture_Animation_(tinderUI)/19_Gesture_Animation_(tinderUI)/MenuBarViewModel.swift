//
//  MenuBarViewModel.swift
//  19_Gesture_Animation_(tinderUI)
//
//  Created by ms k on 6/27/24.
//

import SwiftUI

//TopMenuBar정의
struct TopMenuBarViewModel: View {
    var body: some View {
        HStack{
            Image(systemName: "line.horizontal.3")
                .font(.system(size: 30))
            Spacer()
            Image(systemName: "mappin.and.ellipse")
                .font(.system(size: 35))
            Spacer()
            Image(systemName: "heart.circle.fill")
                .font(.system(size: 30))
        }
        .padding()
    }
}
//BottomMenuBar정의
struct BottomMenuBarViewModel: View {
    var body: some View {
        HStack{
            Image(systemName: "xmark")
                .font(.system(size: 30))
                .foregroundStyle(.black)
            Spacer()
            Button{
                //action : 여행 예약
            } label: {
                Text("예약")
                    .font(.system(.subheadline, design: .rounded))
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.horizontal, 35)
                    .padding(.vertical, 15)
                    .background(.black)
                    .cornerRadius(10.0)
            }
            .padding(.horizontal, 20)
            Spacer()
            Image(systemName: "heart")
                .font(.system(size: 30))
                .foregroundStyle(.black)
        }
        .padding()
        
    }
}

#Preview("TopMenuBarViewModel"){
    BottomMenuBarViewModel()
}

