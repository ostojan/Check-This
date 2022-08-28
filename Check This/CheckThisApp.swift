//
//  Check_ThisApp.swift
//  Check This
//
//  Created by ostojan on 15/08/2022.
//

import SwiftUI

@main
struct CheckThisApp: App {
    private var legacyItemRepository = LegacyItemRepository()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(legacyItemRepository)
        }
    }
}
