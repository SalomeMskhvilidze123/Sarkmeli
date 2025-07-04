//
//  JournalRepositoryProtocol.swift
//  Sarkmeli
//
//  Created by Mcbook Pro on 03.07.25.
//

import Foundation

//(CRUD) mesthod declaration

protocol JournalRepositoryProtocol {
    /// ქმნის და ინახავს ახალ ჩანაწერს.
    func create(entry: JournalEntry)
    
    /// აბრუნებს ყველა შენახულ ჩანაწერს.
    func fetchAll() -> [JournalEntry]
    
    /// ანახლებს არსებულ ჩანაწერს.
    func update(entry: JournalEntry)
    
    /// შლის კონკრეტულ ჩანაწერს.
    func delete(entry: JournalEntry)
}

