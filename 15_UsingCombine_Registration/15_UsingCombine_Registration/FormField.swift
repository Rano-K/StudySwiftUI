//
//  FormField.swift
//  15_UsingCombine_Registration
//
//  Created by ms k on 6/5/24.
//

import SwiftUI

struct FormField : View{
    //field에 입력할 내용
    var fieldName = ""
    @Binding var fieldValue : String
    
    //비밀번호 입력할 때는 isSecure을 true로 바꿀 예정
    var isSecure = false
    
    var body: some View{
        VStack{
            if isSecure{
                SecureField(fieldName, text: $fieldValue)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .padding(.horizontal)
            }else{
                TextField(fieldName, text: $fieldValue)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .padding(.horizontal)
            }
        }
        Divider()
            .frame(height: 1)
            .background(Color(red: 240/255, green: 240/255, blue: 240/255))
            .padding(.horizontal)
    }
    
}
