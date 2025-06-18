//
//  LittleLemonApp.swift
//  LittleLemon
//
//  Created by Matteo Pinzauti on 18/06/25.
//

import SwiftUI

@main
struct LittleLemonApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
