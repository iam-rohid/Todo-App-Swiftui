//
//  TodoModel.swift
//  todo_app
//
//  Created by Rohid on 23/12/21.
//

import Foundation

struct TodoModel: Identifiable {
    var id: String = UUID().uuidString
    var title: String = ""
    var isCompleted: Bool = false
    var isImportant: Bool = false
}
