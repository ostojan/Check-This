//
//  ContentView.swift
//  Check This
//
//  Created by ostojan on 15/08/2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData

    var body: some View {
        NavigationView {
            ItemList(items: $modelData.items)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
