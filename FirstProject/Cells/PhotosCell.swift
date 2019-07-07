//
//  PhotosCell.swift
//  FirstProject
//
//  Created by Антон on 23/05/2019.
//  Copyright © 2019 Антон. All rights reserved.
//

import UIKit

class PhotosCell: UICollectionViewCell {
    
    static let reuseIdentifire = "PhotoCell"
    
    @IBOutlet weak var photoImage: UIImageView!
    

    @IBOutlet weak var likeButton: LikeButton!
    
    @IBOutlet weak var likeCount: LikeCount!
    
    
}
