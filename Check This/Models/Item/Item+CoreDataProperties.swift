//
//  Item+CoreDataProperties.swift
//  Check This
//
//  Created by ostojan on 28/08/2022.
//
//

import CoreData
import Foundation

public extension Item {
    @nonobjc class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged var id: UUID
    @NSManaged var name: String
    @NSManaged var done: Bool
    @NSManaged var created: Date
}

extension Item: Identifiable {}
