//
//  ShadowView.swift
//  FirstProject
//
//  Created by Антон on 02/06/2019.
//  Copyright © 2019 Антон. All rights reserved.
//

import UIKit

class ShadowView: UIView {
   
    @IBInspectable var shadowColor: UIColor = .gray
    @IBInspectable var shadowOpacity: Float = 1
    @IBInspectable var shadowRadius: CGFloat = 8
    @IBInspectable var shadowOffset: CGSize = .zero
    
    var cornerRadius: CGFloat {
        return frame.width/2
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    override func prepareForInterfaceBuilder() {
        sharedInit()
    }
    
    func sharedInit() {
        setCornerRadius(value: cornerRadius)
        setShadow()
    }
    
    func setCornerRadius (value: CGFloat) {
        layer.cornerRadius = value
    }
    
    func setShadow() {
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.shadowOffset = shadowOffset
        layer.masksToBounds = false
    }
    
}
