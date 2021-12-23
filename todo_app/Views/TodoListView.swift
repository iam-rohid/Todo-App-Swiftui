//
//  TodoListView.swift
//  todo_app
//
//  Created by Rohid on 23/12/21.
//

import SwiftUI

struct TodoListView: View {
    @EnvironmentObject var todoListVM:TodoListViewModel
    
    var body: some View {
        List{
            ForEach(todoListVM.todoItems) {item in
                TodoListRowView(todo: item, onChange: {newTodo in
                    todoListVM.updateTodo(item: newTodo)
                })
            }
            .onDelete(perform: todoListVM.deleteItem)
            .onMove(perform: todoListVM.moveItem)
        }
        .navigationTitle("Todo List")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add Todo", destination: {
                AddTodoView(id: nil)
            })
        )
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TodoListView()
        }.environmentObject(TodoListViewModel())
    }
}

