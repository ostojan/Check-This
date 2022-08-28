//
//  ContentView.swift
//  Check This
//
//  Created by ostojan on 15/08/2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var legacyItemRepository: LegacyItemRepository

    var body: some View {
        NavigationView {
            LegacyItemList(legacyItems: $legacyItemRepository.items)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LegacyItemRepository())
    }
}
