//
//  ItemViewModel.swift
//  Check This
//
//  Created by ostojan on 23/10/2022.
//

import Foundation

class ItemViewModel: Identifiable {
    private let item: Item
    private let itemManager: ItemManaging
    
    var id: UUID {
        item.id
    }
    
    var name: String {
        item.name
    }
    
    var done: Bool {
        item.done
    }
    
    init(item: Item, itemManager: ItemManaging) {
        self.item = item
        self.itemManager = itemManager
    }
    
    func toggleDone() {
        item.done.toggle()
    }
    
    func deleteItem() {
        itemManager.delete(item)
    }
}
