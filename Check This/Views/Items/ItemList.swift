//
//  ItemList.swift
//  Check This
//
//  Created by ostojan on 16/08/2022.
//

import SwiftUI

struct ItemList: View {
    @Binding var items: [Item]
    @State var newItemName = ""

    var body: some View {
        List {
            ForEach($items) { item in
                ItemRow(item: item)
                    .onTapGesture {
                        withAnimation {
                            item.wrappedValue.done.toggle()
                        }
                    }
            }
            .onDelete { indexSet in
                withAnimation {
                    items.remove(atOffsets: indexSet)
                }
            }
            HStack {
                TextField("New item", text: $newItemName)
                    .onSubmit(addNewItem)
                Spacer()
                Button(action: addNewItem) {
                    Image(systemName: "plus")
                }
                .disabled(newItemName.isEmpty)
            }
            .padding()
        }
        .listStyle(.inset)
        .navigationTitle("ToDo")
    }

    private func addNewItem() {
        guard !newItemName.isEmpty else {
            return
        }
        withAnimation {
            items.append(Item(name: newItemName))
            newItemName.removeAll()
        }
    }
}

struct ItemList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemList(items: .constant(ModelData().items))
        }
    }
}
