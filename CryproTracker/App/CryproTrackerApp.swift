//
//  CryproTrackerApp.swift
//  CryproTracker
//
//  Created by Mehmet Seyhan on 30/06/2022.
//

import SwiftUI

@main
struct CryproTrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
