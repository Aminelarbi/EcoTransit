//
//  EcoTransitApp.swift
//  EcoTransit
//
//  Created by MedAmineLarbi on 5/11/2023.
//

import SwiftUI

@main
struct EcoTransitApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            NavigationBarView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
