//
//  RecordListController.swift
//  SimpleGame
//
//  Created by Айдар Оспанов on 12.07.2023.
//

import UIKit

final class RecordListController: UITableViewController {
    
    private let storeManager = StoreManager.shared
    private var options: [Option] = []
    //private let gameVC = GameViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Рекорд"
        view.backgroundColor = .white
        options = storeManager.fetchOption()
        //tableView.select
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Record")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        options.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let option = options[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Record", for: indexPath)
        cell.selectionStyle = .none
        var content = cell.defaultContentConfiguration()
        content.text = option.name
        content.secondaryText = "\(option.time)"
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            storeManager.deleteOption(at: indexPath.row)
            options.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
    }
    
//    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        UITableViewCell.EditingStyle.none
//    }
    
}

//extension RecordListController: GameViewControllerDelegate {
//    func add(record: String) {
//        records.append(record)
//        tableView.reloadData()
//    }
//}
