//
//  RecordListController.swift
//  SimpleGame
//
//  Created by Айдар Оспанов on 12.07.2023.
//

import UIKit

final class RecordListController: UITableViewController {
    
    private let storageManager = StorageManager.shared
    private var records: [String] = []
    //private let gameVC = GameViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Рекорд"
        view.backgroundColor = .white
        records = storageManager.fetchRecords()
        //tableView.select
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Record")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        records.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let record = records.sorted(by: <)[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Record", for: indexPath)
        cell.selectionStyle = .none
        var content = cell.defaultContentConfiguration()
        content.text = record
        cell.contentConfiguration = content
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
    
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
