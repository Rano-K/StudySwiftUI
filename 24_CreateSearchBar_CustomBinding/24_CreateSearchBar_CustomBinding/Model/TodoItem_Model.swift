//
//  TodoItem_Model.swift
//  24_CreateSearchBar_CustomBinding
//
//  Created by ms k on 7/25/24.
//

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
