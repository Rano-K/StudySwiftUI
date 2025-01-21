//
//  Split.swift
//  HigherOrderFunc
//
//  Created by ms k on 8/17/24.
//

import SwiftUI

struct SplitView: View {
    
    let message = "Hello World"
    @State var splitMessage = []
    @State var splitSubStringMessage = [String]()
    
    let anotherMessage = "This message is going to be broken in pieces!"
    @State var maxSplitMessage = []
    
    let omitMessage = "This message is going to    be broken in pieces!"
    @State var omitSplitMessage = []
    
    let paragraph = "This paragraph will be separated in parts. Based on the periods and the exclamation mark! There will be three strings!"
    @State var paragraphMessage = []
    
    var body: some View {
        VStack{
            //예제1
            Button("문자열분리"){
//                let result = message.split { (char) -> Bool in
//                    return char == " "
//                }
                let result = message.split{
                    $0 == " " // 띄어쓰기를 기준으로 split
                }
                splitMessage = result
            }
            Text("\(splitMessage)")
                .padding(.bottom, 20)
            
            //예제2
            Button("문자열 maxSplit"){
                let splitOnce = anotherMessage.split(maxSplits: 1, whereSeparator: {
                    $0 == " "
                })
                maxSplitMessage = splitOnce
            }
            Text("\(maxSplitMessage)")
                .padding(.bottom, 20)
            
            //3.
            Button("omitMessage"){
                let emptySequences = omitMessage.split(omittingEmptySubsequences: true, whereSeparator: {$0 == " "})
                omitSplitMessage = emptySequences
            }
            Text("\(omitSplitMessage)")
                .padding(.bottom, 20)
            
            //4.
            Button("문자열객체안에 String.Subsequnece를 넣기"){
                let result = message.split{ $0 == " "} //["Hello", "World!"]출력
                
                //result의 타입은 [String.SubSequence]
                //서브스트링에서 문자열값 생성
                let allStrings = result.map{String($0)}
                splitSubStringMessage = allStrings
            }
            Text("\(splitSubStringMessage)")
            
            //5. split함수에서 지정한 조건이 앞서 사용한 예제보다 복잡할 수 있다.
            // 마침표, 느낌표 문자를 기준으로 단락을 문장을 나눈다.
            Button("복잡한 split"){
                let sentenecs = paragraph.split{ $0 == "." || $0 == "!"}
                paragraphMessage = sentenecs
            }
            Text("\(paragraphMessage)")
        }
    }
}
