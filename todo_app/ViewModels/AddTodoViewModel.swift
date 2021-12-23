//
//  AddTodoViewModel.swift
//  todo_app
//
//  Created by Rohid on 24/12/21.
//

import Foundation

class AddTodoViewModel: ObservableObject {
    @Published var id: String?
    @Published var todo: TodoModel = TodoModel(id: UUID().uuidString, title: "")
    @Published var showAlert:Bool = false
    @Published var alert: AlertModel = AlertModel(title: "", messege: "")
    
    func showAlert( alert: AlertModel){
        showAlert = true
        self.alert = alert
    }
    
    func canSave() -> Bool{
        if todo.title.isEmpty{
            showAlert( alert: AlertModel(title: "Empty Todo", messege: "Can not add empty todo!!! 😵"))
            return false
        }
        else if todo.title.count < 3 {
            showAlert( alert: AlertModel(title: "Short Todo", messege: "Todo must be atleast 3 characters long!!! 😵"))
            return false
        }
        return true
    }
    
    func getTodo() -> TodoModel {
        return todo
    }
}
