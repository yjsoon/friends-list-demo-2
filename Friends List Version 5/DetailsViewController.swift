//
//  DetailsViewController.swift
//  Friends List Version 5
//
//  Created by Soon Yin Jie on 13/7/19.
//  Copyright © 2019 Tinkercademy. All rights reserved.
//

import UIKit
import SafariServices


class DetailsViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameSchoolLabel: UILabel!
    @IBOutlet weak var amusingSlider: UISlider!
    var friend: Friend!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = friend.name
        profileImageView.image = UIImage(named: friend.profileImageName)
        nameSchoolLabel.text = "\(friend.name), \(friend.school)"
        amusingSlider.value = friend.amusingness
    }

    
    @IBAction func instagramButtonPressed(_ sender: Any) {
        guard let url = URL(string: friend.instagramLink) else { return }
        let svc = SFSafariViewController(url: url)
        present(svc, animated: true, completion: nil)
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        friend.amusingness = sender.value
    }
}

