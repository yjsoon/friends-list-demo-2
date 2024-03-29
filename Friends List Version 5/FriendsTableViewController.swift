//
//  FriendsTableViewController.swift
//  Friends List Version 5
//
//  Created by Soon Yin Jie on 13/7/19.
//  Copyright © 2019 Tinkercademy. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    var friends: [Friend] = []
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        if let loadedFriends = Friend.loadFromFile() {
            friends = loadedFriends
        } else {
            friends = Friend.loadSampleData()
            Friend.saveToFile(friends: friends)
        }
    }
    
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        Friend.saveToFile(friends: friends)
//    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as! FriendTableViewCell
        let friend = friends[indexPath.row]
        cell.profileImageView.image = UIImage(named: friend.profileImageName)
        cell.nameLabel.text = friend.name
        cell.schoolLabel.text = friend.school
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            friends.remove(at: indexPath.row)
            Friend.saveToFile(friends: friends)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let friend = friends.remove(at: fromIndexPath.row)
        friends.insert(friend, at: to.row)
        Friend.saveToFile(friends: friends)
        tableView.reloadData()
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showFriend",
            let destVC = segue.destination as? DetailsViewController,
            let indexPath = tableView.indexPathForSelectedRow
        {
            destVC.friend = friends[indexPath.row]
        }
        
    }
    
    @IBAction func unwindToFriendsTable(segue: UIStoryboardSegue) {
        if segue.identifier == "unwindSave" {
            if let sourceVC = segue.source as? AddOrEditTableViewController {
                friends.append(sourceVC.friend)
                Friend.saveToFile(friends: friends)
                tableView.reloadData()
            }
        } else if segue.identifier == "unwindCancel" {
            print("Cancelled, do nothing")
        }
    }
    
}
