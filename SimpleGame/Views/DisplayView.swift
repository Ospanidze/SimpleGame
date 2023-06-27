//
//  DisplayView.swift
//  SimpleGame
//
//  Created by Айдар Оспанов on 27.06.2023.
//

import UIKit

final class DisplayView: UIView {
    
    private let radius: CGFloat = 10
    private let borderWidth: CGFloat = 0.7
    private let borderColor: UIColor = .brown
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        label.textColor = .blue
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        addSubviews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupTitleLable(text: String, color: UIColor) {
        titleLabel.text = text
        titleLabel.textColor = color
    }
    
    func setupNumberLabel(text: String) {
        numberLabel.text = text
    }
    
    func setupTimerLabel(text: String) {
        timerLabel.text = text
    }
    
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        clipsToBounds = true
        layer.cornerRadius = radius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
    
    private func addSubviews() {
        addSubview(titleLabel)
        addSubview(numberLabel)
        addSubview(timerLabel)
    }
    
    
    
}

extension DisplayView {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            numberLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            numberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            numberLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            timerLabel.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 10),
            timerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            timerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            timerLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
            
            
        ])
    }
}
