//
//  ContentView.swift
//  24_CreateSearchBar_CustomBinding
//
//  Created by ms k on 7/25/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
//    @State var todoItems : [ToDoItem] // 주석처리한 이유 : @Query를 통해 todoItems에 저장된 항목 불러올 예정.
//    @Query var todoItems : [ToDoItem]
    @Query(sort: \ToDoItem.priorityNum, order: .reverse) var todoItems : [ToDoItem]
    @State private var showNewTask = false
    
    @Environment(\.modelContext) private var modelContext
    
    @State private var searchText : String = ""
    
    var body: some View {
        ZStack{
            VStack {
                HStack{
                    Text("ToDo")
                        .font(.system(size: 40, weight: .black, design: .rounded))
                    
                    Spacer()
                    
                    Button(action: {
                        self.showNewTask = true
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.purple)
                    })
                }
                .padding()
                
                //SearchBar
                SearchBar(text: $searchText)
                    .padding(.top, -20)
                
                //TODO List
                List{
//                    ForEach(todoItems) {todoItem in
                    ForEach(todoItems.filter({ searchText.isEmpty ? true : $0.name.contains(searchText)})){ todoItem in
                        ToDoListRow(todoItem: todoItem)
                    }
                    .onDelete(perform: deleteTask)
                }
                .listStyle(.plain)
            }
            .rotation3DEffect(Angle(degrees: showNewTask ? 5 : 0),
                                    axis: (x: 1, y: 0, z: 0))
            .offset(y:showNewTask ? -50 : 0)
            .animation(.easeOut, value: showNewTask)
            .onAppear{
                UITableView.appearance().separatorColor = .clear
            }
            
            //Empty View
            if todoItems.count == 0{
                NoDataView()
            }
            
            //Add new ToDo
            if showNewTask{
                BlankView(bgColor : .black)
                    .opacity(0.5)
                    .onTapGesture(perform: {
                        self.showNewTask = false
                    })
//                NewToDoView(isShow: $showNewTask, todoItems: $todoItems, name : "", priority: .normal)
                NewToDoView(isShow: $showNewTask, name: "", priority: .normal)
                       .transition(.move(edge: .bottom))
                       .animation(.interpolatingSpring(stiffness: 200.0, damping: 25.0, initialVelocity: 10.0), value: showNewTask)
            }
        }
        
    }
    //FUCTION
    private func deleteTask(indexSet : IndexSet){
        for index in indexSet{
            let itemDelete = todoItems[index]
            modelContext.delete(itemDelete)
            print(itemDelete)
        }
    }
}
