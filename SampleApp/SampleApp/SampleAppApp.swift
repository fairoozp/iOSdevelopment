//
//  SampleAppApp.swift
//  SampleApp
//
//  Created by Fairooz P on 17/10/22.
//

import SwiftUI

@main
struct SampleAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
