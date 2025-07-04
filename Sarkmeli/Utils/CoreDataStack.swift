//
//  CoreDataStack.swift
//  Sarkmeli
//
//  Created by Mcbook Pro on 03.07.25.
//

import Foundation
import CoreData

final class CoreDataStack {
    private let persistentContainer: NSPersistentContainer
    
    var mainContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    init(inMemory: Bool = false) {
        persistentContainer = NSPersistentContainer(name: "Sarkmeli")
        
        if inMemory {
            let description = NSPersistentStoreDescription()
            description.url = URL(fileURLWithPath: "/dev/null")
            persistentContainer.persistentStoreDescriptions = [description]
        }
        
        persistentContainer.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
}

