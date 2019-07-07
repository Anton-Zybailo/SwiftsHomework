//
//  GroupsCell.swift
//  FirstProject
//
//  Created by Антон on 23/05/2019.
//  Copyright © 2019 Антон. All rights reserved.
//

import UIKit

class GroupsCell: UITableViewCell {

    static let reuseIdentifire = "GroupsCell"
    
    @IBOutlet weak var groupName: UILabel!
    
    @IBOutlet weak var groupPhoto: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
