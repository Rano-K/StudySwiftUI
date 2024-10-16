//
//  TodoItem_Model.swift
//  22_TODO_APP(SwiftData)
//
//  Created by ms k on 7/17/24.
//

///name, priority, isComplete 세가지 속성
///@Observable --> TodoItem에 대한 관찰을 지원, Observable프로토콜을 준수하게 만든다.
///@Observable을 사용할 경우 @Published로 표시
///@Published -> ContentView에서 SwiftUI는 값 변경을 감지, 해당 뷰를 업데이트.
///isComplete값이 변경되면 체크 박스를 토글한다.
///Identifiable프로토콜을 준수해 TodoItem인스턴스에 고유 식별자가 있음. ForEach, List를 표시할 때 identifiable필요.
import Foundation
import SwiftData

enum Priority : Int{
    case low = 0
    case normal = 1
    case high = 2
}

//@Observable class TodoItem : Identifiable{
@Model class ToDoItem : Identifiable{
    var id: UUID
    var name : String // 이름
//    var priority : Priority //우선도 (low / normal / high)
    @Transient var priority : Priority {
        get{
            return Priority(rawValue: Int(priorityNum)) ?? .normal
        }
        set{
            self.priorityNum = Int(newValue.rawValue)
        }
    }
    @Attribute(originalName: "priority") var priorityNum : Priority.RawValue
    
    var isComplete : Bool // 완료 여부
    
    init(id: UUID = UUID(), 
         name: String = "",
         priority: Priority = .normal,
         isComplete: Bool = false) {
        self.id = id
        self.name = name
        self.priorityNum = priority.rawValue
        self.isComplete = isComplete
    }
}
