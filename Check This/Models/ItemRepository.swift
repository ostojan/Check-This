//
//  ModelData.swift
//  Check This
//
//  Created by ostojan on 16/08/2022.
//

import Foundation

final class ItemRepository: ObservableObject {
    @Published var items = [
        Item(name: "Task 1"),
        Item(name: "Task 2", done: true),
        Item(name: "Task 3"),
        Item(name: "Task 4", done: true),
        Item(name: "Task 5"),
        Item(name: "Task 6", done: true),
    ]
}
