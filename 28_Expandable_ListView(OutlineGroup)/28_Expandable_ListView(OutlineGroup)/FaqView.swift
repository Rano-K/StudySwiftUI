//
//  FaqView.swift
//  28_Expandable_ListView(OutlineGroup)
//
//  Created by ms k on 12/4/24.
//

import SwiftUI
///FAQView를 생성한다,
///사용자는 개별질문의 Disclosure표시기를 눌러 질문을 확장하거나 축소한다.
///"모두보기"버튼을 만들어 모든 질문을 한번에 확장가능하도록 한다.

struct FaqView: View {
    
    @State var showAll : Bool = false

    @State private var showContent: [Bool] = Array(repeating: false, count: 3)
    
    private let dateSet = [ (question: "soucreCode를 재사용할 수 있나요?",
                             answer: "sourceCode 를 상업적으로 이용가능"),
                            
                            (question: "무료 업데이트를 받을 수 있나요?",
                             answer: "네! 업데이트는 모든 패키지에 적용됩니다. 책을 구매하면 1년 동안 무료 업데이트를 받게 됩니다"),
                            
                            (question: "책에 대한 최신 소식을 어떻게 받을 수 있나요?",
                             answer: "학습 자료가 업데이트될 때마다 다운로드 지침이 포함된 이메일 알림을 보내드립니다.")
                        ]
    
    
    var body: some View {
        Button(action:{
            self.showAll.toggle()
            showContent = Array(repeating: showAll, count: showContent.count)
        }, label: {
            showAll
            ? VStack{
                Image(systemName : "book.closed")
                Text("close")
            } : VStack{
                Image(systemName : "book")
                Text("open")
            }
        })
        
        List{
            ForEach(dateSet.indices, id: \.self) { index in
                DisclosureGroup(
                    isExpanded: $showContent[index],
                    content: {//질문에 대한 답변 지정
                        Text(dateSet[index].answer)
                        .font(.body)
                        .fontWeight(.light)
                },
                    label: {//질문을 지정
                        Text("\(index + 1) \(dateSet[index].question)")
                        .font(.body)
                        .bold()
                        .foregroundStyle(.black)
                })
                .padding(.leading, 30)
                .padding(.trailing, 30)
            }
        }
    }
}


