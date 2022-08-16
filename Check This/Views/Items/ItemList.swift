//
//  ItemList.swift
//  Check This
//
//  Created by ostojan on 16/08/2022.
//

import SwiftUI

struct ItemList: View {
    @Binding var items: [Item]

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
        }
        .listStyle(.inset)
        .navigationTitle("ToDo")
    }
}

struct ItemList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemList(items: .constant(ModelData().items))
        }
    }
}
