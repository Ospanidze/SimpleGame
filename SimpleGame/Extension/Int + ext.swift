//
//  Int + ext.swift
//  SimpleGame
//
//  Created by Айдар Оспанов on 27.06.2023.
//

import Foundation

extension Int {
    func secondsToString() -> String {
        let minutes = self / 60
        let seconds = self % 60
        
        return String(format: "%d:%02d", minutes, seconds)
    }
}
