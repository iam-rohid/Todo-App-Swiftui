//
//  AddTodoView.swift
//  todo_app
//
//  Created by Rohid on 24/12/21.
//

import SwiftUI

struct AddTodoView: View {
    let id: String?
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var todoListViewModel: TodoListViewModel
    @StateObject var addTodoVM = AddTodoViewModel()
    
    var body: some View {
        VStack{
            ScrollView{
                TextField("My Todo", text: $addTodoVM.titleText)
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(12)
                    .onSubmit {
                        saveTodo()
                    }
            }
            Button (
                action: saveTodo, label: {
                    Text("Save")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(.primary)
                        .cornerRadius(12)
                })
        }
        .padding()
        .navigationTitle(id != nil ? "Update Todo" : "Add Todo")
        .alert(isPresented: $addTodoVM.showAlert, content: getAlert)
        .onAppear(perform: {
            if id != nil{
                let todo = todoListViewModel.getItem(id: id!)
                if todo != nil {
                    addTodoVM.titleText = todo!.title
                }
            }
        })
    }
    
    func getAlert() -> Alert{
        return Alert(title: Text(addTodoVM.alert.title), message: Text(addTodoVM.alert.messege))
    }
    
    func saveTodo(){
        if addTodoVM.canSave(){
            todoListViewModel.addItem(item: addTodoVM.getTodo(id: id ?? UUID().uuidString))
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddTodoView(id: nil)
        }.environmentObject(TodoListViewModel())
    }
}
