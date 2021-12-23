//
//  TodoListViewModel.swift
//  todo_app
//
//  Created by Rohid on 23/12/21.
//

import Foundation
import SwiftUI

class TodoListViewModel: ObservableObject {
    @Published var todoItems: [TodoModel] = []
    
    init(){
        todoItems.append(contentsOf: [
            TodoModel(title: "This is first item", isCompleted: false, isImportant: true),
            TodoModel(title: "This is second item", isCompleted: true, isImportant: false),
            TodoModel(title: "This is third item", isCompleted: false, isImportant: false)
        ])
    }
    
    func addItem(item: TodoModel) {
        if let index = todoItems.firstIndex(where: {$0.id == item.id}){
            todoItems[index] = item
            return
        }
        todoItems.append(item)
    }
    
    func getItem(id: String) -> TodoModel? {
        if let index = todoItems.firstIndex(where: {$0.id == id}){
            return todoItems[index]
        }
        return nil
    }
    
    func updateTodo(item: TodoModel){
        if let index = todoItems.firstIndex(where: {$0.id == item.id}){
            todoItems[index] = item
        }
    }
    
    func moveItem(from: IndexSet, to: Int){
        todoItems.move(fromOffsets: from, toOffset: to)
    }
    
    func deleteItem(indexSet: IndexSet){
        todoItems.remove(atOffsets: indexSet)
    }
}
