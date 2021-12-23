//
//  todo_appApp.swift
//  todo_app
//
//  Created by Rohid on 23/12/21.
//

import SwiftUI

@main
struct todo_appApp: App {
    @StateObject var todoListViewModel: TodoListViewModel = TodoListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                
                    TodoListView()
            }.environmentObject(todoListViewModel)
        }
    }
}
