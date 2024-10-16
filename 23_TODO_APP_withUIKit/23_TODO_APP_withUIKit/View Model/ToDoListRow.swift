//
//  ToDoListRow.swift
//  22_TODO_APP(SwiftData)
//
//  Created by ms k on 7/19/24.
//

import SwiftUI
///이 뷰는ObservableObject인 할 일 항목을 받는다.
///할 일 항목에 대한 변경사항이 있을 때 해당 항목을 구독하는 뷰가 자동으로 무효화 된다.
///ios17에서는 @Bindable속성 래퍼를 사용하여 관찰 가능한 객체의 바인딩을 유지할 수 있다.
///1. 작업이 완료되었는지 나타내는 토글/체크박스
///2. 작업이름을 표시하는 텍스트 레이블
///3. 작업의 우선순위를 나타내는 점/원
///
struct ToDoListRow: View {
    
    @Bindable var todoItem : ToDoItem
    
    var body: some View {
        Toggle(isOn: self.$todoItem.isComplete, label: {
            HStack{
                Text(self.todoItem.name)
                    .strikethrough(self.todoItem.isComplete, color: .black)
                    .bold()
                    .animation(.default)
                Spacer()
                
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundStyle(self.color(for: self.todoItem.priority))
            }
        })
        .toggleStyle(CheckBoxStyle())
    }
    private func color(for priority: Priority) -> Color{
        switch priority{
        case .high: return .red
        case .normal: return .orange
        case .low: return .green
        }
    }
}
