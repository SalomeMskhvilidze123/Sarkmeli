//
//  CoreDataJournalRepository.swift
//  Sarkmeli
//
//  Created by Mcbook Pro on 03.07.25.
//

import Foundation
import CoreData

final class CoreDataJournalRepository: JournalRepositoryProtocol {
    
    // MARK: - Properties

    private let coreDataStack: CoreDataStack
    
    // MARK: - Initializer
    
    init(coreDataStack: CoreDataStack) {
        self.coreDataStack = coreDataStack
    }
    
    // MARK: - Protocol Methods (CRUD)
    
    func create(entry: JournalEntry) {
        // 1. ვიღებთ "სამუშაო მაგიდას" (კონტექსტს).
        let context = coreDataStack.mainContext
        
        // 2. ვქმნით Core Data-ს ობიექტს (NSManagedObject) ჩვენი მოდელისგან.
        // ეს ჰგავს, რომ "თიხის ფიგურას" ვქმნით ჩვენი ნახაზის მიხედვით.
        let newManagedEntry = JournalEntryManagedObject(context: context)
        
        // 3. გადაგვაქვს მონაცემები ჩვენი მოდელიდან Core Data-ს ობიექტზე.
        newManagedEntry.id = entry.id
        newManagedEntry.text = entry.text
        newManagedEntry.category = entry.category
        newManagedEntry.timestamp = entry.timestamp
        
        // 4. ვინახავთ ცვლილებებს "საწარმოს მთავარ საწყობში".
        do {
            try context.save()
        } catch {
            // რეალურ აპლიკაციაში აქ უფრო დახვეწილი ლოგიკა იქნება.
            print("Failed to save entry: \(error)")
        }
    }
    
    func fetchAll() -> [JournalEntry] {
        let context = coreDataStack.mainContext
        
        // 1. ვქმნით "მოთხოვნის ბარათს", რომლითაც "საწყობს" მივმართავთ.
        let fetchRequest: NSFetchRequest<JournalEntryManagedObject> = JournalEntryManagedObject.fetchRequest()
        
        do {
            // 2. ვასრულებთ მოთხოვნას და ვიღებთ Core Data-ს ობიექტების მასივს.
            let managedEntries = try context.fetch(fetchRequest)
            
            // 3. "ვთარგმნით" Core Data-ს ობიექტებს ჩვენს სუფთა, მოდელის ობიექტებად.
            // ეს მნიშვნელოვანია, რათა დანარჩენმა აპლიკაციამ Core Data-ზე არაფერი იცოდეს.
            let entries = managedEntries.map { managedObject in
                return JournalEntry(
                    id: managedObject.id ?? UUID(),
                    text: managedObject.text ?? "",
                    category: managedObject.category ?? "",
                    timestamp: managedObject.timestamp ?? Date()
                )
            }
            return entries
        } catch {
            print("Failed to fetch entries: \(error)")
            return []
        }
    }
    
    func update(entry: JournalEntry) {
        // TODO: იმპლემენტაცია მომავალში
    }
    
    func delete(entry: JournalEntry) {
        // TODO: იმპლემენტაცია მომავალში
    }
}

