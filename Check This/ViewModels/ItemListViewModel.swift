//
//  ItemListViewModel.swift
//  Check This
//
//  Created by ostojan on 11/11/2022.
//

import Foundation

class ItemListViewModel: ObservableObject {
    @Published var itemViewModels = [ItemViewModel]()
    private let itemManager = ItemManager()
    
    func fetchAllItems() {
        itemViewModels = itemManager.fetchAllItems().map(ItemViewModel.init)
    }
    
    func createNewItem(name: String) {
        itemManager.createNewItem(name: name)
    }
    
    func saveData() {
        itemManager.saveData()
        fetchAllItems()
    }
}
