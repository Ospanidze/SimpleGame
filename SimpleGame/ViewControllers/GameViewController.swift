//
//  ViewController.swift
//  SimpleGame
//
//  Created by Айдар Оспанов on 08.05.2023.
//

import UIKit

//protocol GameViewControllerDelegate {
//    func add(record: String)
//}

final class GameViewController: UIViewController {
    
    private let storeManager = StoreManager.shared
    private var option: Option?
    
    private var time: Int?
    
    //private let optionVC = OptionViewController()
    
    fileprivate var mainView: MainView {
        guard let view = self.view as? MainView else {
            return MainView()
        }
        return view
    }
    
    //private let storageManager = StorageManager.shared
    
    private lazy var game = Game(
        countItems: mainView.keyboardView.gameButtons.count, time: option?.time ?? 50) { [weak self] status, seconds in
            self?.mainView.displayView.setupTimerLabel(text: seconds.secondsToString())
            self?.updateInfoGame(with: status)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreen()
        mainView.keyboardView.delegate = self
        mainView.mainViewDelegate = self
        //optionVC.delegate = self
        print(game.bestRecord)
    }
    
    override func loadView() {
        super.loadView()
        view = MainView(frame: UIScreen.main.bounds)
        option = storeManager.fetchOption().last
    }
    
    private func setupScreen() {
        for index in game.items.indices {
            let button = mainView.keyboardView.gameButtons[index]
            
            button.setTitle(game.items[index].title, for: .normal)
        
            button.alpha = 1
            button.isEnabled = true
        }
        
        mainView.displayView.setupNumberLabel(text: game.nextItem?.title ?? "")
    }
    
    private func update() {
        for index in game.items.indices {
            let gameButton = mainView.keyboardView.gameButtons[index]
            //gameButton.isHidden = game.items[index].isFound
            
            gameButton.alpha = game.items[index].isFound ? 0 : 1
            gameButton.isEnabled = !game.items[index].isFound
            
            if game.items[index].isError {
                UIView.animate(withDuration: 0.3) { [weak self] in
                    self?.mainView.keyboardView.gameButtons[index].backgroundColor = .red
                } completion: { [weak self] _ in
                    self?.mainView.keyboardView.gameButtons[index].backgroundColor = .white
                    self?.game.items[index].isError = false
                }
            }
        }
        
        mainView.displayView.setupNumberLabel(text: game.nextItem?.title ?? "")
        
        updateInfoGame(with: game.status)
    }
    
    private func updateInfoGame(with status: Status) {
        let display = mainView.displayView
        
        switch status {
        case .start:
            display.setupTitleLable(text: "Игра началась", color: .black)
            mainView.setupButton(true)
        case .win:
            display.setupTitleLable(text: "Вы выиграли!", color: .green)
            mainView.setupButton(false)
//            save()
        case .lose:
            display.setupTitleLable(text: "Вы проиграли:(", color: .red)
            mainView.setupButton(false)
        }
    }
    
//    private func save() {
//        storageManager.save(record: "\(game.bestRecord)")
//        //delegate?.add(record: "\(game.bestRecord)")
//    }
    
    deinit {
        print("ViewController is deleted")
    }
}

extension GameViewController: KeyboardViewDelegate {
    func onAction(sender: GameButton) {
        guard let buttonIndex = mainView.keyboardView.gameButtons
            .firstIndex(of: sender) else { return }
        game.check(index: buttonIndex)
        update()
    }
}

extension GameViewController: MainViewDelegate {
    func newGameAction(sender: UIButton) {
        game.newGame()
        
        sender.isHidden = true
        setupScreen()
    }
}

//extension GameViewController: GameViewControllerDelegate {
//    func add(option: Option) {
//        time = option.time
//        //mainView.keyboardView.num = option.button
//    }
//}
