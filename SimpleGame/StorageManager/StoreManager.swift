//
//  StoreManager.swift
//  SimpleGame
//
//  Created by Айдар Оспанов on 14.07.2023.
//

import Foundation

class StoreManager {
    static let shared = StoreManager()
    
    private let userDefaults = UserDefaults.standard
    private let key = "option"
    
    private init() {}
    
    func save(option: Option) {
        var options = fetchOption()
        options.append(option)
        //userDefaults.set(records, forKey: key)
        guard let data = try? JSONEncoder().encode(options) else { return }
        userDefaults.set(data, forKey: key)
    }
    
    func fetchOption() -> [Option] {
        guard let data = userDefaults.data(forKey: key) else { return [] }
        guard let options = try? JSONDecoder().decode([Option].self, from: data) else { return [] }
        return options
    }
    
    func deleteOption(at index: Int) {
        var options = fetchOption()
        options.remove(at: index)
        guard let data = try? JSONEncoder().encode(options) else { return }
        userDefaults.set(data, forKey: key)
    }
}
