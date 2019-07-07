//
//  LikeButtom.swift
//  FirstProject
//
//  Created by Антон on 03/06/2019.
//  Copyright © 2019 Антон. All rights reserved.
//

import UIKit


class LikeButton: UIControl {
    
    
    var isLiked: Bool = false
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let sideOne = rect.height * 0.4
        let sideTwo = rect.height * 0.3
        let arcRadius = sqrt(sideOne*sideOne + sideTwo*sideTwo)/2
        
        let path = UIBezierPath()
        
        path.addArc(withCenter: CGPoint(x: rect.height * 0.3, y: rect.height * 0.35), radius: arcRadius, startAngle: 135.degreesToRadians, endAngle: 315.degreesToRadians, clockwise: true)
        path.addArc(withCenter: CGPoint(x: rect.height * 0.7, y: rect.height * 0.35), radius: arcRadius, startAngle: 225.degreesToRadians, endAngle: 45.degreesToRadians, clockwise: true)
        path.addLine(to: CGPoint(x: rect.height * 0.5, y: rect.height * 0.95))
        
        path.close()
        
        UIColor.red.setStroke()
        UIColor.red.setFill()
        
        isLiked ? path.fill() : path.stroke()
        
    }
    
    
    func setupView() {
        self.addTarget(self, action: #selector(changeState), for: .touchUpInside)
        
        self.addTarget(self, action: #selector(likeButtonDidTapped), for: .valueChanged)
        
        
        self.backgroundColor = UIColor.green
        self.layer.cornerRadius = min(self.bounds.height, self.bounds.width)/5
        clipsToBounds = true
    }
    
    @objc func likeButtonDidTapped () {

    }
    
    @objc func changeState () {
        isLiked.toggle()
        self.sendActions(for: .valueChanged)
        setNeedsDisplay()
    }

}

extension Int {
    var degreesToRadians: CGFloat { return CGFloat(self) * .pi / 180 }
}



// Для лэйбла и счета
class LikeCount: UILabel {

    var likeCount: String = "1"

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
