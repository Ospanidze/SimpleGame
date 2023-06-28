//
//  MainViewController.swift
//  SimpleGame
//
//  Created by Айдар Оспанов on 28.06.2023.
//

import UIKit
 
final class MainViewController: UIViewController {
    
    private let titles = ["Новая Игра", "Настройки", "Рекорд"]
    
    private let baseStackView = UIStackView()
        .styleStackView(
            spacing: 10,
            aligment: .fill,
            axis: .vertical,
            distribution: .fillEqually,
            userInteraction: true
        )
        .setlayoutMargins(top: 10, left: 12, right: 12, bottom: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setupNavigationBar()
        setupStackView()
        addSubviews()
        setupLayout()
        
    }
    
    private func addSubviews() {
        view.addSubview(baseStackView)
    }
    
    private func createButton(title: String, type: Int) -> UIButton {
        let button: GameButton
        
        button = GameButton(
            model: ModelGameButton(
                title: title,
                font: UIFont.systemFont(ofSize: 24, weight: .medium),
                backgroundColor: .clear,
                titleColor: .blue
            ),
            typeNumber: type
        )
        button.addTarget(self, action: #selector(action), for: .touchUpInside)
        
        return button
    }
    
    @objc private func action(sender: GameButton) {
        switch sender.typeNumber {
        case 0:
            let gameVC = GameViewController()
            navigationController?.pushViewController(gameVC, animated: true)
        default:
            break
        }
    }
    
    private func setupStackView() {
        for (index, title) in titles.enumerated() {
            let button = createButton(title: title, type: index)
            baseStackView.addArrangedSubview(button)
        }
    }
}

extension MainViewController {
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            baseStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            baseStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    private func setupNavigationBar() {
        title = "Меню"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = UIColor(named: "MilkBlue") ?? .black
        
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationController?.navigationBar.tintColor = .white
    }
}

