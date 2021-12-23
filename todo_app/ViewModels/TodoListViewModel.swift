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
    @Published var isShowingSheet: Bool = false
    
    init(){
        todoItems.append(contentsOf: [
            TodoModel(title: "This is first item", isCompleted: false, isImportant: true),
            TodoModel(title: "This is second item", isCompleted: true, isImportant: false),
            TodoModel(title: "This is third item", isCompleted: false, isImportant: false)
        ])
    }
    
    func showSheet(){
        isShowingSheet = true
    }
    
    func onSheetDismiss(){
        isShowingSheet = false
    }
    
    func addItem(item: TodoModel) {
        for (index, todo) in todoItems.enumerated() {
            if todo.id == item.id{
                todoItems[index] = item
                return
            }
        }
        todoItems.append(item)
    }
    
    func getItem(id: String) -> TodoModel? {
        for todo in todoItems {
            if todo.id == id{
                return todo
            }
        }
        return nil
    }
    func moveItem(from: IndexSet, to: Int){
        todoItems.move(fromOffsets: from, toOffset: to)
    }
    
    func updateTodo(item: TodoModel){
        for index in 0...todoItems.count-1{
            if todoItems[index].id == item.id {
                todoItems[index] = item
            }
        }
    }
    
    func moveItemToTrash(index: IndexSet){
        todoItems.remove(atOffsets: index)
    }
}
