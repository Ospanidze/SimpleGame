//
//  UIButton + ext.swift
//  SimpleGame
//
//  Created by Айдар Оспанов on 28.05.2023.
//

import UIKit

extension UIButton {
    convenience init(number: Int) {
        self.init(frame: .zero)
        self.setTitle(String(number), for: .normal)
        self.setTitleColor(.green, for: .normal)
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.blue.cgColor
        self.layer.cornerRadius = 15
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
