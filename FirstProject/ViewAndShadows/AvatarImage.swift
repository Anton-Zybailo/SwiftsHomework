//
//  AvatarImage.swift
//  FirstProject
//
//  Created by Антон on 02/06/2019.
//  Copyright © 2019 Антон. All rights reserved.
//

import UIKit

class AvatarView: UIImageView {
    
    
    override var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    private var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView = UIImageView (frame: bounds)
        imageView.clipsToBounds = true
        addSubview(imageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
        layer.cornerRadius = bounds.width/2
        imageView.layer.cornerRadius = bounds.width/2
    }
}
