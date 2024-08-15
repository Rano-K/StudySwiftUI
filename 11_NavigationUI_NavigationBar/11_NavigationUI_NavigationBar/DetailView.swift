//
//  DetailView.swift
//  11_NavigationUI_NavigationBar
//
//  Created by ms k on 4/28/24.
//

import SwiftUI

struct DetailView: View {
    
    ///ENVIRONMENT?
    ///현재 환경 설정을 다른 환경에서도 적용하고 싶을 때 사용.
    ///상위뷰 -> 하위뷰로 전달 가능
    @Environment(\.dismiss) var dismiss
    
    @Binding var dismissCount : Int
    
    var restaurant : Restaurant
    
    var body: some View {
        VStack{
            Text("DismissCount : \(dismissCount)")
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(restaurant.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItem(placement: .navigation){
                Button(action: {
                    dismiss()
                    dismissCount += 1
                }, label: {
                    Image(systemName: "xmark")
                        .imageScale(.large)
                        .padding()
                })
            }
        }
    }
}
