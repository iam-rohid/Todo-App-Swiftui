//
//  TodoModel.swift
//  todo_app
//
//  Created by Rohid on 23/12/21.
//

import Foundation
import SwiftUI

struct TodoModel: Identifiable {
    let id: String
    let title: String
    let isCompleted: Bool
    let isImportant: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool = false, isImportant: Bool = false){
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.isImportant = isImportant
    }
    
    func toggleImportant(value: Bool? = nil) -> TodoModel{
        return TodoModel(id: id, title: title, isCompleted: isCompleted, isImportant: value ?? !isImportant)
    }
    
    func toggleCompoleted(value: Bool? = nil) -> TodoModel{
        print("Working")
        return TodoModel(id: id, title: title, isCompleted: value ?? !isCompleted, isImportant: isImportant)
    }
    
    func changeTitle(value: String) -> TodoModel{
        return TodoModel(id: id, title: value, isCompleted: isCompleted, isImportant: isImportant)
    }
}
