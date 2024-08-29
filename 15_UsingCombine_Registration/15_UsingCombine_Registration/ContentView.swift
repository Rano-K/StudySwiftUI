//
//  ContentView.swift
//  15_UsingCombine_Registration
//
//  Created by ms k on 5/16/24.
//

import SwiftUI
//======================MainContentViewSTART============================
struct ContentView: View {
    
    var body: some View {
        VStack {
            Text("Create an account")
                .font(.system(.largeTitle, design: .rounded))
                .bold()
                .padding(.bottom, 30)
            
            CreatePrompt()
            SignUpPrompt()
            SignInPrompt()
            
        }
    }
}
//=========================MainContentViewEND============================

struct CreatePrompt : View{
    
    @State private var username : String = ""//username 받을거니깐
    @State private var password : String = ""//password 받을거니깐
    @State private var passwordConfirm : String = ""//passwordConfirm받을거니깐
    //일단 값을 입력받을 대상을 전부 @State로 선언한뒤 받아온다.
    
    //Combine에 이용될 변수
    @ObservedObject private var userViewModel = UserViewModel()
    
    var body: some View{
        VStack{
            //이름 입력 필드
            
            FormField(fieldName: "아이디", fieldValue: $userViewModel.username)
            RequirementText(
                iconColor: userViewModel.isUsernameLengthValid
                ? Color.secondary
                : Color(red: 251/255, green: 128/255, blue: 128/255),
                text: "4자 이상의 문자를 입력해주세요",
                isStrikeThrough: userViewModel.isUsernameLengthValid
            )
//                .padding(.init(top: 0, leading: 20, bottom: 30, trailing: 0))
            .padding()
            
            
            //비밀번호 입력 필드
            FormField(fieldName: "비밀번호",fieldValue: $userViewModel.password, isSecure: true)
            VStack{
                RequirementText(iconName: "lock.open",
                                iconColor: userViewModel.isPasswordLengthValid ? Color.secondary : Color(red: 251/255, green: 128/255, blue: 128/255),
                                text: "최소 8자리의 문자를 입력해주세요",
                                isStrikeThrough: userViewModel.isPasswordLengthValid)
//                    .padding(.leading, 20)
                RequirementText(iconName: "lock.open",
                                iconColor: userViewModel.isPasswordCapitalLetter ? Color.secondary : Color(red: 251/255, green: 128/255, blue: 128/255),
                                text: "한개 이상의 대문자를 넣어주세요",
                                isStrikeThrough: userViewModel.isPasswordCapitalLetter)
//                    .padding(.leading, 20)
            }
//            .padding(.bottom, 20)
            .padding()
            
            FormField(fieldName : "비밀번호 확인", fieldValue: $userViewModel.passwordConfirm, isSecure: true)
            RequirementText(iconColor: userViewModel.isPasswordConfirmValid ? Color.secondary : Color(red: 251/255, green: 128/255, blue: 128/255),
                            text: "비밀번호와 동일해야 합니다.",
                            isStrikeThrough: userViewModel.isPasswordConfirmValid)
//                .padding(.init(top: 0, leading: 20, bottom: 60, trailing: 0))
                .padding()
                .padding(.bottom, 50)
        }
    }
}

struct SignUpPrompt : View{
    var body: some View{
        Button(action: {
            
        }){
            Text("회원가입")
                .font(.system(.body, design: .rounded))
                .foregroundStyle(.white)
                .bold()
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(LinearGradient(gradient: Gradient(colors: [Color(red: 251/255, green: 128/255, blue: 253/255), Color(red: 253/255, green: 193/255, blue: 104/255)]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(10)
                .padding(.horizontal)
        }
    }
}

struct SignInPrompt : View {
    var body: some View {
        HStack{
            Text("이미 계정이 있으신가요?")
                .font(.system(.body, design: .rounded))
                .bold()
            
            Button(action: {
                
            }){
                Text("로그인")
                    .font(.system(.body, design: .rounded))
                    .bold()
                    .foregroundColor(Color(red: 251/255, green: 128/255, blue: 128/255))
            }
        }
        .padding(.top, 50)
    }
}

