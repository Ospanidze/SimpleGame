//
//  OptionViewController.swift
//  SimpleGame
//
//  Created by Айдар Оспанов on 14.07.2023.
//

import UIKit

final class OptionViewController: UIViewController {
    
    private let optionStackView = UIStackView()
        .styleStackView(
            spacing: 10,
            aligment: .fill,
            axis: .vertical,
            distribution: .fillEqually,
            userInteraction: true
        )
        .setlayoutMargins(top: 10, left: 12, right: 12, bottom: 10)
    
    private let nameTF = OptionTextField(placeholder: "Your name")
    private let timeTF = OptionTextField(placeholder: "Time")
    private let levelTF = OptionTextField(placeholder: "How many buttons?")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Настройки"
        view.backgroundColor = .systemGray5
        addSubviews()
        setupLayout()
        setupStackView()
    }
    
    private func addSubviews() {
        view.addSubview(optionStackView)
    }
    
    private func setupStackView() {
        optionStackView.addArrangedSubview(nameTF)
        optionStackView.addArrangedSubview(timeTF)
        optionStackView.addArrangedSubview(levelTF)
    }
    
}

extension OptionViewController {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            optionStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            optionStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            optionStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
    }
}
