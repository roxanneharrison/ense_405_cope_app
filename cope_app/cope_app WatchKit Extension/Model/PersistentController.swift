//
//  PersistentController.swift
//  cope_app WatchKit Extension
//
//  Created by Roxanne Harrison on 2021-10-23.
//


// Singleton to initialize the data controller

import Foundation
import CoreData

struct PersistentController {
    static let shared = PersistentController()
    let container: NSPersistentContainer
    init(inMemory: Bool = false) {
        // Using the data model to initialize the container
        container = NSPersistentContainer(name: "CopeData")
        // Save data in memory
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        // Throw error if data cannot be loaded
        container.loadPersistentStores{(storeDesc, error) in
            if let error = error as NSError? {
                fatalError("Failed to load container \(error)")
            }
        }
    }
}
