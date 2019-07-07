//
//  AllGroupsViewController.swift
//  FirstProject
//
//  Created by Антон on 19/05/2019.
//  Copyright © 2019 Антон. All rights reserved.
//

import UIKit

class AllGroupsViewController: UITableViewController {
    
    var groups:[GroupModel] = [
        GroupModel(name: "Cats Rules", image: #imageLiteral(resourceName: "cat")),
        GroupModel(name: "C++ for noob", image: #imageLiteral(resourceName: "cpp")),
        GroupModel(name: "OMG WTF Final", image: #imageLiteral(resourceName: "Stark")),
        GroupModel(name: "You was rich", image: #imageLiteral(resourceName: "Bitcoin"))
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroupsCell", for: indexPath) as? GroupsCell else {return GroupsCell ()}
        
        cell.groupName.text = groups[indexPath.row].name
        cell.groupPhoto.image = groups[indexPath.row].image
        return cell
    }


    

/*
 // Override to support conditional editing of the table view.
 override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
 // Return false if you do not want the specified item to be editable.
 return true
 }
 */

/*
 // Override to support editing the table view.
 override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
 if editingStyle == .delete {
 // Delete the row from the data source
 tableView.deleteRows(at: [indexPath], with: .fade)
 } else if editingStyle == .insert {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
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
