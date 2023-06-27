//
//  MainView.swift
//  SimpleGame
//
//  Created by Айдар Оспанов on 27.06.2023.
//

import UIKit

final class MainView: UIView {
    
    let displayView = DisplayView()
    
    let keyboardView = KeyboardView()
    
    weak var mainViewDelegate: MainViewDelegate?
    
    private lazy var newGameButton: UIButton = {
        let button = UIButton()
        button.setTitle("Новая игра", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(newGameAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray6
        addSubviews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton(_ isHidden: Bool) {
        newGameButton.isHidden = isHidden
    }
    
    @objc private func newGameAction(sender: UIButton) {
        mainViewDelegate?.newGameAction(sender: sender)
    }
    
    private func addSubviews() {
        addSubview(displayView)
        addSubview(keyboardView)
        addSubview(newGameButton)
    }

}

extension MainView {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            displayView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
            displayView.heightAnchor.constraint(equalToConstant: 150),
            displayView.centerXAnchor.constraint(equalTo: centerXAnchor),
            displayView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30)
        ])
        
        NSLayoutConstraint.activate([
            newGameButton.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2),
            newGameButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4),
            newGameButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            newGameButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            keyboardView.topAnchor.constraint(equalTo: displayView.bottomAnchor, constant: 20),
            keyboardView.widthAnchor.constraint(equalTo: widthAnchor),
            keyboardView.centerXAnchor.constraint(equalTo: centerXAnchor),
            keyboardView.bottomAnchor.constraint(equalTo: newGameButton.topAnchor, constant: -20)
        ])
        
        
    }
}
