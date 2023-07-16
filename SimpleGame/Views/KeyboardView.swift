//
//  KeyboardView.swift
//  SimpleGame
//
//  Created by Айдар Оспанов on 27.06.2023.
//

import UIKit

final class KeyboardView: UIView {
    
    var gameButtons: [UIButton] = []
    
    weak var delegate: KeyboardViewDelegate?
    
    private let num = 16
    
    private let rowInStackView = 4
    
    private let mainStackView = UIStackView()
        .styleStackView(
            spacing: 10,
            aligment: .fill,
            axis: .vertical,
            distribution: .fillEqually,
            userInteraction: true
        )
        .setlayoutMargins(top: 10, left: 12, right: 12, bottom: 10)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        addSubviews()
        setupLayout()
        createPostionButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addSubviews() {
        addSubview(mainStackView)
    }
    
    private func createButton(type: Int) -> UIButton {
        let button: GameButton
        let title = String(type)
        
        button = GameButton(
            model: ModelGameButton(
                title: title,
                font: UIFont.systemFont(ofSize: 30, weight: .heavy),
                backgroundColor: .white,
                titleColor: .black
            ),
            typeNumber: type
        )
        
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        return button
    }
    
    @objc private func buttonAction(sender: GameButton) {
        delegate?.onAction(sender: sender)
    }
    
    private func createStackViewNumber(element: UIButton) {
        gameButtons.append(element)
        guard gameButtons.count == num else { return }
        
        guard num % 4 == 0 && num > 0 else { return }
        
        var count = 0
        var inRow = 4
        
        for _ in 0..<num / 4 {
            
            let stackView = UIStackView()
                .styleStackView(
                    spacing: 10,
                    aligment: .fill,
                    axis: .horizontal,
                    distribution: .fillEqually,
                    userInteraction: true
                )
            
            while count < inRow {
                stackView.addArrangedSubview(gameButtons[count])
                count += 1
            }
            
            mainStackView.addArrangedSubview(stackView)
            inRow += rowInStackView
        }
        
    }
    
    private func createPostionButtons () {
        
        for number in 1...num  {
            let button = createButton(type: number)
            createStackViewNumber(element: button)
        }
    }
    
    private func checkNumber(num: Int?) -> Int {
        guard let num = num else { return 16 }
        guard num > 0 else { return 16 }
        guard num % 4 == 0 else { return  16 }
        return num / 4
    }
    
}

extension KeyboardView {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
