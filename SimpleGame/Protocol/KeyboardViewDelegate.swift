//
//  KeyboardViewDelegate.swift
//  SimpleGame
//
//  Created by Айдар Оспанов on 27.06.2023.
//

import Foundation

protocol KeyboardViewDelegate: AnyObject {
    func onAction(sender: GameButton)
}
