//
//  Item+CoreDataProperties.swift
//  Check This
//
//  Created by ostojan on 28/08/2022.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var id: UUID
    @NSManaged public var name: String
    @NSManaged public var done: Bool
    @NSManaged public var created: Date

}

extension Item : Identifiable {

}
