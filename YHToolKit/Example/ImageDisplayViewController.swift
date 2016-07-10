//
//  ImageDisplayViewController
//  YHToolKit
//
//  Created by Jeff Lin on 7/9/16.
//  Copyright © 2016 JeffLin. All rights reserved.
//

import Foundation
import UIKit

class ImageDisplayViewController: UIViewController {
    var displayImage: UIImage?
    var mainImageView: UIImageView!
    var titleLabel: UILabel!
    var describeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.view.backgroundColor = UIColor.white()
    }
    
    func setupView() -> Void {
        self.mainImageView = UIImageView.init(frame: CGRect.zero)
        self.mainImageView.image = self.displayImage
        self.mainImageView.contentMode = .scaleAspectFit
        self.view.addSubview(self.mainImageView)
        
        self.titleLabel = UILabel.init(frame: CGRect.zero)
        self.titleLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyleHeadline)
        self.titleLabel.text = "Sunset"
        self.view.addSubview(self.titleLabel)
        
        self.describeLabel = UILabel.init(frame: CGRect.zero)
        self.describeLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyleBody)
        self.describeLabel.text = "What a beautiful sunset"
        self.view.addSubview(self.describeLabel)
        
        self.mainImageView.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.describeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addConstraint(NSLayoutConstraint.init(item: self.mainImageView, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.leading, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint.init(item: self.mainImageView, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.trailing, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint.init(item: self.mainImageView, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: self.mainImageView, attribute: NSLayoutAttribute.height, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint.init(item: self.mainImageView, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.centerY, multiplier: 1.0, constant: 0.0))
        
        self.view.addConstraint(NSLayoutConstraint.init(item: self.describeLabel, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: -30.0))
        self.view.addConstraint(NSLayoutConstraint.init(item: self.describeLabel, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.leading, multiplier: 1.0, constant: 30.0))

        self.view.addConstraint(NSLayoutConstraint.init(item: self.titleLabel, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.leading, multiplier: 1.0, constant: 30.0))
        self.view.addConstraint(NSLayoutConstraint.init(item: self.titleLabel, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self.describeLabel, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: -20.0))
    }
}

extension ImageDisplayViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        print(viewController)
    }
}

// MARK:
