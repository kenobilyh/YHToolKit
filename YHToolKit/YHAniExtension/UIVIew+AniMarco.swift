//
//  UIVIew+AniMarco.swift
//  YHToolKit
//
//  Created by Jeff Lin on 7/8/16.
//  Copyright © 2016 JeffLin. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func focusRect(_ rectToFocus: CGRect, toRect:CGRect, duration:TimeInterval, options: UIViewAnimationOptions, completion: ((Bool) -> Swift.Void)? = nil) {
        let scaleFactor = min(toRect.width / rectToFocus.width, toRect.height / rectToFocus.height)
        
        UIView.animate(withDuration: duration, delay: 0, options: options, animations: {
            self.transform = CGAffineTransform.init(scaleX: scaleFactor, y: scaleFactor)
            self.frame.origin = CGPoint.init(x: toRect.minX - rectToFocus.minX * scaleFactor + (toRect.width - rectToFocus.width * scaleFactor) / 2.0, y: toRect.minY - rectToFocus.minY * scaleFactor + (toRect.height - rectToFocus.height * scaleFactor) / 2.0)
            }, completion:completion)
    }
}
