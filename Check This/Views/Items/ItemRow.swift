//
//  ItemRow.swift
//  Check This
//
//  Created by ostojan on 28/08/2022.
//

import SwiftUI

struct ItemRow: View {
    let itemViewModel: ItemViewModel
    
    var body: some View {
        HStack {
            if itemViewModel.done {
                itemNameText
                    .strikethrough()
            } else {
                itemNameText
            }
        }
        .padding()
    }
    
    private var itemNameText: Text {
        Text(itemViewModel.name)
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var viewContext = PersistenceController.preview.viewContext
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
            ItemRow(itemViewModel: ItemViewModel(createItem(done: false)))
                .previewDisplayName("Unfinished")
                .previewLayout(.sizeThatFits)
            ItemRow(itemViewModel: ItemViewModel(createItem(done: true)))
                .previewDisplayName("Finished")
                .previewLayout(.sizeThatFits)
        }
    }
}
