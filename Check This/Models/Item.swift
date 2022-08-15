//
//  Item.swift
//  Check This
//
//  Created by ostojan on 15/08/2022.
//

import Foundation

struct Item: Hashable, Identifiable, Codable {
    var id = UUID()
    var name: String
    var done = false
}
