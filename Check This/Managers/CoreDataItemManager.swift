//
//  ItemManager.swift
//  Check This
//
//  Created by ostojan on 14/11/2022.
//

import Foundation

class CoreDataItemManager: ItemManaging {
    private let viewContext = PersistenceController.shared.viewContext
    
    func fetchAllItems() -> [Item] {
        let request = Item.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "created", ascending: true)]
        do {
            return try viewContext.fetch(request)
        } catch {
            print("Couldn't fetch items: \(error.localizedDescription)")
            return []
        }
    }
    
    func createNewItem(name: String, done: Bool, created: Date) {
        let newItem = Item(context: viewContext)
        newItem.id = UUID()
        newItem.name = name
        newItem.done = done
        newItem.created = created
    }
    
    func delete(_ item: Item) {
        viewContext.delete(item)
    }

    func saveData() {
        do {
            try viewContext.save()
        } catch {
            print("Couldn't save data: \(error.localizedDescription)")
        }
    }
}
