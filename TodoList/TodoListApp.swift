//
//  TodoListApp.swift
//  TodoList
//
//  Created by Nicholas Cher Kwok Hui on 06/08/2024.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
