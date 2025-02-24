//
//  userModel.swift
//  15_UsingCombine_Registration
//
//  Created by ms k on 6/5/24.
//

import Foundation
import Combine

class UserViewModel : ObservableObject{
    //입력
    @Published var username = ""
    @Published var password = ""
    @Published var passwordConfirm = ""
    
    //출력
    @Published var isUsernameLengthValid = false
    @Published var isPasswordLengthValid = false
    @Published var isPasswordCapitalLetter = false
    @Published var isPasswordConfirmValid = false
    
    private var cancellableSet : Set<AnyCancellable> = []
    
    init() {
        $username
            .receive(on: RunLoop.main)
            .map { username in
                return username.count >= 4
            }
            .assign(to: \.isUsernameLengthValid, on: self)
            .store(in: &cancellableSet)
        
        //Password글자수
        $password
            .receive(on: RunLoop.main)
            .map{ password in
                return password.count >= 8
            }
            .assign(to: \.isPasswordLengthValid, on: self)
            .store(in: &cancellableSet)
        
        //Password대문자(using regex)
        $password
            .receive(on: RunLoop.main)
            .map{ password in
                let pattern = "[A-Z]"
                if let _ = password.range(of: pattern, options: .regularExpression){
                    return true
                }else{
                    return false
                }
            }
            .assign(to: \.isPasswordCapitalLetter, on: self)
            .store(in: &cancellableSet)
        
        Publishers.CombineLatest($password, $passwordConfirm)
            .receive(on: RunLoop.main)
            .map{ (password, passwordConfirm) in
                return !passwordConfirm.isEmpty && (passwordConfirm == password)
            }
            .assign(to: \.isPasswordConfirmValid, on: self)
            .store(in: &cancellableSet)
    }
    
}
