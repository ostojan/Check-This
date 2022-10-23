//
//  ItemList.swift
//  Check This
//
//  Created by ostojan on 28/08/2022.
//

import SwiftUI

struct ItemList: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Item.created, ascending: true)])
    private var items: FetchedResults<Item>
    @State private var newItemName = ""
    
    var body: some View {
        List {
            ForEach(items) { item in
                ItemRow(itemViewModel: ItemViewModel(item))
                    .onTapGesture {
                        withAnimation {
                            do {
                                item.done.toggle()
                                try viewContext.save()
                            } catch {
                                fatalError("Couldn't update Item")
                            }
                        }
                    }
            }
            .onDelete { offsets in
                offsets
                    .map { items[$0] }
                    .forEach {
                        do {
                            viewContext.delete($0)
                            try viewContext.save()
                        } catch {
                            fatalError("Couldn't delete item")
                        }
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
    }
    
    private func addNewItem() {
        guard !newItemName.isEmpty else {
            return
        }
        withAnimation {
            do {
                let newItem = Item(context: viewContext)
                newItem.id = UUID()
                newItem.name = newItemName
                newItem.done = false
                newItem.created = Date()
                try viewContext.save()
                newItemName.removeAll()
            } catch {
                fatalError("Couldn't create new Item")
            }
        }
    }
}

struct ItemList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemList()
                .environment(\.managedObjectContext, PersistenceController.preview.viewContext)
        }
    }
}
