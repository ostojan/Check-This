//
//  ItemManaging.swift
//  Check This
//
//  Created by ostojan on 14/11/2022.
//

import Foundation

protocol ItemManaging {
    func fetchAllItems() -> [Item]
    func createNewItem(name: String, done: Bool, created: Date)
    func delete(_ item: Item)
    func saveData()
}
