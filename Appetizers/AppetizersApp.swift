//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by User on 15/03/2024.
//

import SwiftUI

@main
struct AppetizersApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
