//
//  cope_appApp.swift
//  cope_app WatchKit Extension
//
//  Created by Roxanne Harrison on 2021-10-23.
//

import SwiftUI

@main
struct CopeApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                CopeView()
            }
            // Get the environment key to be able to get the data from the persistent controller
            .environment(\.managedObjectContext, PersistentController.shared.container.viewContext)
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
