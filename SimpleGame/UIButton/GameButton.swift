//
//  GameButton.swift
//  SimpleGame
//
//  Created by Айдар Оспанов on 27.06.2023.
//

import UIKit

struct ModelGameButton {
    let title: String
    let font: UIFont
    let backgroundColor: UIColor
    let titleColor: UIColor
}

final class GameButton: UIButton {
    
    let typeNumber: Int
    
    init(model: ModelGameButton, typeNumber: Int) {
        self.typeNumber = typeNumber
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        setConfiguration(model: model)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConfiguration(model: ModelGameButton) {
        backgroundColor = model.backgroundColor
        contentMode = .scaleAspectFill
        setTitle(model.title, for: .normal)
        setTitleColor(model.titleColor, for: .normal)
        setTitleColor(model.titleColor.withAlphaComponent(0.7), for: .highlighted)
        titleLabel?.font = model.font
    }
    
}
