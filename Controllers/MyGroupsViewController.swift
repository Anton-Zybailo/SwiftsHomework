//
//  MyGroupsViewController.swift
//  FirstProject
//
//  Created by Антон on 19/05/2019.
//  Copyright © 2019 Антон. All rights reserved.
//

import UIKit

class MyGroupsViewController: UITableViewController {

    var groups:[GroupModel] = [
        GroupModel(name: "Swift kills Me", image: #imageLiteral(resourceName: "swift")),
        GroupModel(name: "Cat or What?", image: #imageLiteral(resourceName: "git")),
        GroupModel(name: "Punk not Dead", image: #imageLiteral(resourceName: "maracas"))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GroupsCell.reuseIdentifire, for: indexPath) as? GroupsCell else {return GroupsCell ()}

        cell.groupName.text = groups[indexPath.row].name
        cell.groupPhoto.image = groups[indexPath.row].image
        return cell
    }
    

    // MARK: - Navigation
    @IBAction func addGroup(segue: UIStoryboardSegue){
        // Проверяем идентификатор, чтобы убедиться, что это нужный переход
        if segue.identifier == "addGroup" {
        // Получаем ссылку на контроллер, с которого осуществлен переход
            let allGroupsController = segue.source as! AllGroupsViewController
        // Получаем индекс выделенной ячейки
            if let indexPath = allGroupsController.tableView.indexPathForSelectedRow {
                let group = allGroupsController.groups[indexPath.row]
        // Проверка, есть ли такай группа в списке
                guard !groups.contains(where: {$0.name == group.name}) else {return}
                    
                groups.append(group)
        // Обновляем таблицу
                tableView.reloadData()
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
     // Удаление группы
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     // Если нажата кнопка удаления
     if editingStyle == .delete {
        groups.remove(at: indexPath.row)
    // Удаляем строку из таблицы
        tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
}
