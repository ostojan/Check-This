//
//  ItemViewModel.swift
//  Check This
//
//  Created by ostojan on 23/10/2022.
//

import Foundation

class ItemViewModel: Identifiable {
    private let item: Item
    private let viewContext = PersistenceController.shared.viewContext
    
    var id: UUID {
        item.id
    }
    
    var name: String {
        item.name
    }
    
    var done: Bool {
        item.done
    }
    
    init(_ item: Item) {
        self.item = item
    }
    
    func toggleDone() {
        item.done.toggle()
    }
    
    func deleteItem() {
        viewContext.delete(item)
    }
}
