//
//  ContentView.swift
//  Check This
//
//  Created by ostojan on 15/08/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ItemList()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
