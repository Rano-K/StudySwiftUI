//
//  NewToDoView.swift
//  22_TODO_APP(SwiftData)
//
//  Created by ms k on 7/19/24.
//

import SwiftUI

struct NewToDoView: View {
    
    //isShow는 Add New Task가 뷰가 화면에 나타날지를 제어
    @Binding var isShow : Bool
    //todoItems는 배열항목의 참조를 유지
//    @Binding var todoItems : [ToDoItem]
    @State var name : String
    @State var priority : Priority
    //isEditing의 경우 사용자가 name을 편집하는지 아닌지를 판단. => 키보드가 화면을 가림을 방지하기 위해 편집중에는 해당 textfield를 위로 올린다.
    @State var isEditing : Bool = false
    
    //모델 컨텍스트를 저장하기 위한 변수 'modelContext'선언.
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        VStack{
            Spacer() //저장하는 항목을 제일 아래로 내리기 위한 Spacer
            
            VStack(alignment: .leading, content: {
                HStack{
                    Text("Add a new task")
                        .font(.system(.title, design: .rounded))
                        .bold()
                    
                    Button(action: {
                        self.isShow = false
                    }, label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(.background)
                            .font(.headline)
                            
                    })
                }
                
                TextField("ToDo 등록", text: $name, onEditingChanged: { (editingChanged) in
                    self.isEditing = editingChanged
                })
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.bottom)
                    
                
                
                Text("우선순위")
                    .font(.system(.subheadline, design: .rounded))
//                    .padding(.bottom)
                
                HStack(content: {
                    Text("High")
                        .font(.system(.headline, design: .rounded))
                        .padding(10)
                        .background(priority == .high ? Color.red : Color(.systemGray4))
                        .foregroundStyle(.white)
                        .cornerRadius(8)
                        .onTapGesture {
                            self.priority = .high
                        }
                    Text("Normal")
                        .font(.system(.headline, design: .rounded))
                        .padding(10)
                        .background(priority == .normal ? Color.orange : Color(.systemGray4))
                        .foregroundStyle(.white)
                        .cornerRadius(8)
                        .onTapGesture {
                            self.priority = .normal
                        }
                    
                    Text("Low")
                        .font(.system(.headline, design: .rounded))
                        .padding(10)
                        .background(priority == .low ? Color.green : Color(.systemGray4))
                        .foregroundStyle(.white)
                        .cornerRadius(8)
                        .onTapGesture {
                            self.priority = .low
                        }
                })
                .padding(.bottom, 30)
                
                //저장버튼 만들기
                Button(action: {
                    if self.name.trimmingCharacters(in: .whitespaces) == "" {return}
                    self.isShow = false
                    self.addTask(name: self.name, priority: self.priority)
                }, label: {
                    Text("Save")
                        .font(.system(.headline, design: .rounded))
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .foregroundStyle(.white)
                        .background(Color.purple)
                        .cornerRadius(10)
                })
                .padding(.bottom)
            })
            .padding()
            .background(.white)
            .cornerRadius(10, antialiased: true)
            .offset(y: isEditing ? -320 : 0)//사용중일경우 y축의 좌표를 조정한다.
        }
        .edgesIgnoringSafeArea(.bottom)
    }
    
    private func addTask(name: String, priority: Priority, isComplete: Bool = false){
        let task = ToDoItem(name: name, priority: priority, isComplete: isComplete)
        modelContext.insert(task)
    }
}

