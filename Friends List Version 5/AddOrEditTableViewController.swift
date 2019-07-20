//
//  AddOrEditTableViewController.swift
//  Friends List Version 5
//
//  Created by Soon Yin Jie on 13/7/19.
//  Copyright © 2019 Tinkercademy. All rights reserved.
//

import UIKit

class AddOrEditTableViewController: UITableViewController {

    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var schoolLabel: UITextField!
    @IBOutlet weak var profileImageLabel: UITextField!
    @IBOutlet weak var instagramLabel: UITextField!
    var friend: Friend!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindSave" {
            
            
            // Note: Below is pointless, all the texts are "" by default
//            let name = nameLabel.text ?? "No Name" // put in a default value for Optionals
//            let school = schoolLabel.text ?? ""
//            let profileImage = profileImageLabel.text ?? "hugface"
//            let instagramLink = instagramLabel.text ?? ""
            
            // Let's just force unwrap
            let name = nameLabel.text!
            let school = schoolLabel.text!
            let profileImage = profileImageLabel.text!
            let instagramLink = instagramLabel.text!
            
            friend = Friend(name: name, school: school, profileImageName: profileImage, instagramLink: instagramLink)
        }
    }


}
