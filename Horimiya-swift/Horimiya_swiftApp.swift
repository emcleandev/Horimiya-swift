//
//  Horimiya_swiftApp.swift
//  Horimiya-swift
//
//  Created by Emmanuel Mclean on 15/11/2021.
//

import SwiftUI

@main
struct Horimiya_swiftApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
