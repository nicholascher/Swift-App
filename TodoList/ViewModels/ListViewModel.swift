//
//  ListViewModel.swift
//  TodoList
//
//  Created by Nicholas Cher Kwok Hui on 06/08/2024.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let defaultItems = [
            ItemModel(title: "This is the first", isCompleted: true),
            ItemModel(title: "This is the second", isCompleted: false),
            ItemModel(title: "This is the third", isCompleted: false),
        ]
        
        items.append(contentsOf: defaultItems)
    }
    
    func deleteItem(index: IndexSet) {
        items.remove(atOffsets: index)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title:title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        // Code below is shorthand for this
//      if let index = items.firstIndex { (existingItem) -> Bool in
//            return existingItem.id == item.id
//        }
        // If statement used to handle the optional (if no items)
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.toggleisCompleted()
        }
    }
}



