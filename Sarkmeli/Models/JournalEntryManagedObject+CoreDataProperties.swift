//
//  JournalEntryManagedObject+CoreDataProperties.swift
//  Sarkmeli
//
//  Created by Mcbook Pro on 04.07.25.
//
//

import Foundation
import CoreData


extension JournalEntryManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<JournalEntryManagedObject> {
        return NSFetchRequest<JournalEntryManagedObject>(entityName: "JournalEntryManagedObject")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var text: String?
    @NSManaged public var category: String?
    @NSManaged public var timestamp: Date?

}

extension JournalEntryManagedObject : Identifiable {

}
