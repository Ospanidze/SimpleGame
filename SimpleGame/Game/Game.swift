//
//  Game.swift
//  SimpleGame
//
//  Created by Айдар Оспанов on 27.06.2023.
//

import Foundation

enum Status {
    case start, win, lose
}

struct Item {
    let title: String
    var isFound = false
    var isError = false
}

class Game {
    var items: [Item] = []
    
    var nextItem: Item?
    
    var status: Status = .start {
        didSet {
            if status != .start {
                stopGame()
            }
        }
    }
    
    private let countItems: Int
    
    private var timeForGame: Int
    private var secondsGame: Int {
        didSet {
            if secondsGame == 0 {
                status = .lose
            }
            
            updateTimer(status, secondsGame)
        }
    }
    
    private var timer: Timer?
    private var updateTimer: ((Status, Int) -> Void)
    
    private let numbers = Array(1...99)
    
    init(countItems: Int, time: Int, updateTimer: @escaping(_ status: Status, _ seconds: Int) -> Void) {
        self.countItems = countItems
        secondsGame = time
        timeForGame = time
        self.updateTimer = updateTimer
        setupGame()
    }
    
    func check(index: Int) {
        guard status == .start else { return }
        if items[index].title == nextItem?.title {
            items[index].isFound = true
            nextItem = items.shuffled().first(where: { item in
                item.isFound == false
            })
        } else {
            items[index].isError = true
        }
        
        if nextItem == nil {
            status = .win
        }
    }
    
    func newGame() {
        status = .start
        secondsGame = timeForGame
        setupGame()
    }
    
    private func setupGame() {
        var integers = numbers.shuffled()
        
        items.removeAll()
        
        while items.count < countItems {
            let item = Item(title: String(integers.removeFirst()))
            items.append(item)
        }
        
        nextItem = items.shuffled().first
        
        updateTimer(status, secondsGame)
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self] _ in
            self?.secondsGame -= 1
        })
    }
    
    private func stopGame() {
        timer?.invalidate()
    }
}
