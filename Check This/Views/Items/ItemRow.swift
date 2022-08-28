//
//  ItemRow.swift
//  Check This
//
//  Created by ostojan on 28/08/2022.
//

import SwiftUI

struct ItemRow: View {
    @ObservedObject var item: Item
    
    var body: some View {
        HStack {
            if item.done {
                itemNameText
                    .strikethrough()
            } else {
                itemNameText
            }
        }
        .padding()
    }
    
    private var itemNameText: Text {
        Text(item.name)
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var viewContext = PersistenceController.preview.container.viewContext
    static func createItem(done: Bool) -> Item {
        let newItem = Item(context: viewContext)
        newItem.id = UUID()
        newItem.name = "Task"
        newItem.done = done
        newItem.created = Date()
        
        do {
            try viewContext.save()
        } catch {
            fatalError("Couldn't create Item for preview")
        }
        
        return newItem
    }
    static var previews: some View {
        Group {
            ItemRow(item: createItem(done: false))
                .previewDisplayName("Unfinished")
                .previewLayout(.sizeThatFits)
            ItemRow(item: createItem(done: true))
                .previewDisplayName("Finished")
                .previewLayout(.sizeThatFits)
        }
    }
}
