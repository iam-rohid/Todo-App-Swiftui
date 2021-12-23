//
//  TodoView.swift
//  todo_app
//
//  Created by Rohid on 23/12/21.
//

import SwiftUI

struct TodoListRowView: View {
    let todo: TodoModel
    let onChange: (_ item: TodoModel) -> Void
    var body: some View {
        HStack {
            Button (action: {
                var newData = todo
                newData.isCompleted.toggle()
                onChange(newData)
            }, label: {
                Image(systemName: todo.isCompleted ? "checkmark.circle" : "circle")
                    .foregroundColor(todo.isCompleted ? .green : Color(UIColor.placeholderText))
                    .font(.system(size: 24))
            })
            Text(todo.title)
                .strikethrough(todo.isCompleted)
            Spacer()
        }
    }
}

struct TodoListRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            TodoListRowView(todo: TodoModel(title: "Hello World", isCompleted: false), onChange: {item in })
            
            TodoListRowView(todo: TodoModel(title: "Hello World", isCompleted: true)
                            , onChange: {item in })
        }.previewLayout(.sizeThatFits)
    }
}
