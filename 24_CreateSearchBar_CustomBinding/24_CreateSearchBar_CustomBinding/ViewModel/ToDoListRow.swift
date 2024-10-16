//
//  ToDoListRow.swift
//  24_CreateSearchBar_CustomBinding
//
//  Created by ms k on 7/25/24.
//

import SwiftUI

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
