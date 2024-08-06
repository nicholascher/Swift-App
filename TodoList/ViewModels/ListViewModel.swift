//
//  ListViewModel.swift
//  TodoList
//
//  Created by Nicholas Cher Kwok Hui on 06/08/2024.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    private final let itemsKey: String = "list_items"
    
    init() {
        getItems()
    }
    
    func getItems() {
        
        // guard statement used to handle the optionals, else used for error handling
        guard
            let savedDataJson = UserDefaults.standard.data(forKey: itemsKey),
            let savedData = try? JSONDecoder().decode([ItemModel].self, from: savedDataJson)
        else {
            return
        }
        
        self.items = savedData
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

    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
}



