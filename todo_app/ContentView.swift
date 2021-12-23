//
//  ContentView.swift
//  todo_app
//
//  Created by Rohid on 23/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TodoListView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
