//
//  ItemListViewModel.swift
//  Check This
//
//  Created by ostojan on 11/11/2022.
//

import Foundation

class ItemListViewModel: ObservableObject {
    @Published var itemViewModels = [ItemViewModel]()
    private let itemManager: ItemManaging
    
    init(itemManager: ItemManaging = CoreDataItemManager()) {
        self.itemManager = itemManager
    }
    
    func fetchAllItems() {
        itemViewModels = itemManager.fetchAllItems().map {
            ItemViewModel.init(item: $0, itemManager: itemManager)
        }
    }
    
    func createNewItem(name: String) {
        itemManager.createNewItem(name: name)
    }
    
    func saveData() {
        itemManager.saveData()
        fetchAllItems()
    }
}
