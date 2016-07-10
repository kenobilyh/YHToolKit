//
//  ImageCollectionViewCell.swift
//  YHToolKit
//
//  Created by Jeff Lin on 7/10/16.
//  Copyright © 2016 JeffLin. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    var imageView : UIImageView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupComponents()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupComponents()
    }
    
    func setupComponents() -> Void {
        self.imageView = UIImageView.init(frame: CGRect.zero)
        self.imageView.contentMode = .scaleAspectFit
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.imageView)
        
        let inset:CGFloat = 0.0
        self.addConstraint(NSLayoutConstraint (item: self.imageView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: inset))
        self.addConstraint(NSLayoutConstraint (item: self.imageView, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.leading, multiplier: 1.0, constant: inset))
        self.addConstraint(NSLayoutConstraint (item: self.imageView, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.trailing, multiplier: 1.0, constant: -inset))
        self.addConstraint(NSLayoutConstraint (item: self.imageView, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: -inset))
    }
}
