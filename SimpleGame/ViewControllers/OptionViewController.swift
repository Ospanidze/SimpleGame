//
//  OptionViewController.swift
//  SimpleGame
//
//  Created by Айдар Оспанов on 14.07.2023.
//

import UIKit

//protocol GameViewControllerDelegate {
//    func add(option: Option)
//}

final class OptionViewController: UIViewController {
    
    //var delegate: GameViewControllerDelegate?
    
    private let storeManager = StoreManager.shared

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
    
    private let timeTF = OptionTextField(
        placeholder: "Time",
        keyboardType: .numberPad
    )
//    private let levelTF = OptionTextField(
//        placeholder: "How many buttons?",
//        keyboardType: .numberPad
//    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Настройки"
        view.backgroundColor = .systemGray5
        addSubviews()
        setupLayout()
        
        setupStackView()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        navigationItem.rightBarButtonItem?.isEnabled = false
        doneButtonIsEnabled()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    private func addSubviews() {
        view.addSubview(optionStackView)
    }
    
    private func setupStackView() {
        optionStackView.addArrangedSubview(nameTF)
        optionStackView.addArrangedSubview(timeTF)
        //optionStackView.addArrangedSubview(levelTF)
    }
    
    @objc private func doneButtonTapped() {
        save()
        
    }
    
    private func doneButtonIsEnabled() {
        let action = UIAction { [weak self ] _ in
            guard let name = self?.nameTF.text else { return }
            self?.navigationItem.rightBarButtonItem?.isEnabled = !name.isEmpty
        }
        nameTF.addAction(action, for: .editingChanged)
    }
    
    private func save() {
        guard let name = nameTF.text else { return }
        guard let time = timeTF.text else { return }
        //guard let level = levelTF.text else { return }
        
        let number = Int(time) ?? 30
        let seconds = number >= 30 && number <= 120 ? number : 45
    
        let option = Option(
            name: name,
            time: seconds
        )
        
        storeManager.save(option: option)
        navigationController?.popViewController(animated: true)
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
