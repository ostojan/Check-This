//
//  ItemList.swift
//  Check This
//
//  Created by ostojan on 28/08/2022.
//

import SwiftUI

struct ItemList: View {
    @ObservedObject private var itemListViewModel = ItemListViewModel()
    @State private var newItemName = ""

    var body: some View {
        List {
            ForEach(itemListViewModel.itemViewModels) { itemViewModel in
                ItemRow(itemViewModel: itemViewModel)
                    .onTapGesture {
                        itemViewModel.toggleDone()
                        withAnimation {
                            itemListViewModel.saveData()
                        }
                    }
            }
            .onDelete { offsets in
                offsets
                    .map { itemListViewModel.itemViewModels[$0] }
                    .forEach { $0.deleteItem() }
                withAnimation {
                    itemListViewModel.saveData()
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
        .navigationTitle(Text("ToDo"))
        .onAppear { itemListViewModel.fetchAllItems() }
    }

    private func addNewItem() {
        guard !newItemName.isEmpty else {
            return
        }
        itemListViewModel.createNewItem(name: newItemName)
        withAnimation {
            itemListViewModel.saveData()
            newItemName.removeAll()
        }
    }
}

struct ItemList_Previews: PreviewProvider {
    static var previews: some View {
        PersistenceController.initPreviewController()
        return NavigationView {
            ItemList()
        }
    }
}
