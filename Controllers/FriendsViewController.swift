//
//  FriendsViewController.swift
//  FirstProject
//
//  Created by Антон on 19/05/2019.
//  Copyright © 2019 Антон. All rights reserved.
//

import UIKit

class FriendsViewController: UITableViewController {

    
    var friends: [FriendModel] = [
        FriendModel(name: "mr. Fox", image: #imageLiteral(resourceName: "Fox"), photo: #imageLiteral(resourceName: "FoxPhoto")),
        FriendModel(name: "Rorschach", image: #imageLiteral(resourceName: "Rorschach"), photo: #imageLiteral(resourceName: "RorschachPhoto")),
        FriendModel(name: "Dracula jr.", image: #imageLiteral(resourceName: "Dracula"), photo: #imageLiteral(resourceName: "Dracula")),
        FriendModel(name: "Bart Simpson", image: #imageLiteral(resourceName: "Bart"), photo: #imageLiteral(resourceName: "BartPhoto")),
        FriendModel(name: "Chew Chewbacca", image: #imageLiteral(resourceName: "chewbacca"), photo: #imageLiteral(resourceName: "chewbaccaPhoto")),
        FriendModel(name: "Bruce Batman", image: #imageLiteral(resourceName: "Batman"), photo: #imageLiteral(resourceName: "BatmanPhoto")),
        FriendModel(name: "Santa Awesome Clause", image: #imageLiteral(resourceName: "Santa"), photo: #imageLiteral(resourceName: "SantaPhoto"))
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as? FriendsCell else {return FriendsCell ()}
        
        cell.friendName.text = friends[indexPath.row].name
        cell.friendPhoto.image = friends[indexPath.row].image
        return cell
    }
    
        // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowPhoto",
            // передача заголовка на PhotosController
            let photosViewCollectionController = segue.destination as? PhotosViewCollectionController,
            let indexPath = tableView.indexPathForSelectedRow {
            let friendName = friends[indexPath.row].name
            photosViewCollectionController.photoTitle = friendName
            
            // передача фото на CollectionView
            let userPhoto = friends[indexPath.row]
            photosViewCollectionController.photos = [userPhoto]
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
