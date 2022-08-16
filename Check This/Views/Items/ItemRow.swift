//
//  ItemRow.swift
//  Check This
//
//  Created by ostojan on 16/08/2022.
//

import SwiftUI

struct ItemRow: View {
    @Binding var item: Item

    var body: some View {
        HStack {
            if item.done {
                itemName
                    .strikethrough()
            } else {
                itemName
            }
        }
        .padding()
    }

    var itemName: Text {
        Text(item.name)
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: .constant(Item(name: "Task", done: true)))
            .previewDisplayName("Done")
            .previewLayout(.sizeThatFits)
        ItemRow(item: .constant(Item(name: "Task")))
            .previewDisplayName("Undone")
            .previewLayout(.sizeThatFits)
    }
}
