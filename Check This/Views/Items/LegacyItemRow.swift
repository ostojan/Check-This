//
//  ItemRow.swift
//  Check This
//
//  Created by ostojan on 16/08/2022.
//

import SwiftUI

struct LegacyItemRow: View {
    var legacyItem: LegacyItem

    var body: some View {
        HStack {
            if legacyItem.done {
                legacyItemName
                    .strikethrough()
            } else {
                legacyItemName
            }
        }
        .padding()
    }

    var legacyItemName: Text {
        Text(legacyItem.name)
    }
}

struct LegacyItemRow_Previews: PreviewProvider {
    static var previews: some View {
        LegacyItemRow(legacyItem: LegacyItem(name: "Task", done: true))
            .previewDisplayName("Done")
            .previewLayout(.sizeThatFits)
        LegacyItemRow(legacyItem: LegacyItem(name: "Task"))
            .previewDisplayName("Undone")
            .previewLayout(.sizeThatFits)
    }
}
