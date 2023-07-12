//
//  StorageManager.swift
//  SimpleGame
//
//  Created by Айдар Оспанов on 12.07.2023.
//

import Foundation

class StorageManager {
    static let shared = StorageManager()
    
    private let userDefaults = UserDefaults.standard
    private let key = "record"
    
    private init() {}
    
    func save(record: String) {
        var records = fetchRecords()
        records.append(record)
        userDefaults.set(records, forKey: key)
    }
    
    func fetchRecords() -> [String] {
        if let records = userDefaults.stringArray(forKey: key) {
            return records
        }
        
        return []
    }
    
//    func deleteRecord(at index: Int) {
//        var records = fetchRecords()
//        records.remove(at: index)
//        userDefaults.set(records, forKey: key)
//    }
}
