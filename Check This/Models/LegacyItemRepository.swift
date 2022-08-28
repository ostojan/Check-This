//
//  ModelData.swift
//  Check This
//
//  Created by ostojan on 16/08/2022.
//

import Foundation

final class LegacyItemRepository: ObservableObject {
    @Published var items = [
        LegacyItem(name: "Task 1"),
        LegacyItem(name: "Task 2", done: true),
        LegacyItem(name: "Task 3"),
        LegacyItem(name: "Task 4", done: true),
        LegacyItem(name: "Task 5"),
        LegacyItem(name: "Task 6", done: true),
    ]
}
