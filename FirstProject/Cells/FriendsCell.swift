//
//  FriendsCell.swift
//  FirstProject
//
//  Created by Антон on 23/05/2019.
//  Copyright © 2019 Антон. All rights reserved.
//

import UIKit

class FriendsCell: UITableViewCell {

    static let reuseIdentifire = "FriendsCell"
    
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var friendPhoto: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
