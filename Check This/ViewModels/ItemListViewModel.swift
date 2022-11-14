//
//  ItemListViewModel.swift
//  Check This
//
//  Created by ostojan on 11/11/2022.
//

import Foundation

class ItemListViewModel: ObservableObject {
    @Published var itemViewModels = [ItemViewModel]()
    private let viewContext = PersistenceController.shared.viewContext
    
    func fetchAllItems() {
        let request = Item.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "created", ascending: true)]
        do {
            itemViewModels = try viewContext.fetch(request).map(ItemViewModel.init)
        } catch {
            print("Couldn't fetch items: \(error.localizedDescription)")
        }
    }
    
    func createNewItem(name: String) {
        let newItem = Item(context: viewContext)
        newItem.id = UUID()
        newItem.name = name
        newItem.done = false
        newItem.created = Date()
    }
    
    func saveData() {
        do {
            try viewContext.save()
            fetchAllItems()
        } catch {
            print("Couldn't save data: \(error.localizedDescription)")
        }
    }
}
