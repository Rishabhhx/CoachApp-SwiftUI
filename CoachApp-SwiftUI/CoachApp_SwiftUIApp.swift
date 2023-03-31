//
//  CoachApp_SwiftUIApp.swift
//  CoachApp-SwiftUI
//
//  Created by Rishabh Sharma on 31/03/23.
//

import SwiftUI

@main
struct CoachApp_SwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
