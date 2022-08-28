//
//  ItemList.swift
//  Check This
//
//  Created by ostojan on 16/08/2022.
//

import SwiftUI

struct LegacyItemList: View {
    @Binding var legacyItems: [LegacyItem]
    @State var newLegacyItemName = ""

    var body: some View {
        List {
            ForEach($legacyItems) { item in
                LegacyItemRow(legacyItem: item.wrappedValue)
                    .onTapGesture {
                        withAnimation {
                            item.wrappedValue.done.toggle()
                        }
                    }
            }
            .onDelete { indexSet in
                withAnimation {
                    legacyItems.remove(atOffsets: indexSet)
                }
            }
            HStack {
                TextField("New item", text: $newLegacyItemName)
                    .onSubmit(addNewItem)
                Spacer()
                Button(action: addNewItem) {
                    Image(systemName: "plus")
                }
                .disabled(newLegacyItemName.isEmpty)
            }
            .padding()
        }
        .listStyle(.inset)
        .navigationTitle("ToDo")
    }

    private func addNewItem() {
        guard !newLegacyItemName.isEmpty else {
            return
        }
        withAnimation {
            legacyItems.append(LegacyItem(name: newLegacyItemName))
            newLegacyItemName.removeAll()
        }
    }
}

struct LegacyItemList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LegacyItemList(legacyItems: .constant(LegacyItemRepository().items))
        }
    }
}
