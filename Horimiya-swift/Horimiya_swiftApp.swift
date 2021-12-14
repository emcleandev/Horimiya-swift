//
//  Horimiya_swiftApp.swift
//  Horimiya-swift
//
//  Created by Emmanuel Mclean on 15/11/2021.
//

import SwiftUI

@main
@available(iOS 15.0, *)
struct Horimiya_swiftApp: App {
    let persistenceController = PersistenceController.shared
    @Environment(\.scenePhase) var scenePhase
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { _ in
            persistenceController.save()
        }
    }
}
