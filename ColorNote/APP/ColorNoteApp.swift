//
//  ColorNoteApp.swift
//  ColorNote
//
//  Created by Jacob Ko on 2022/12/28.
//

import SwiftUI

@main
struct ColorNoteApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
