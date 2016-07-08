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
    func focusRect(_ rectTofocus: CGRect, toRect:CGRect, duration:TimeInterval, options: UIViewAnimationOptions, completion: ((Bool) -> Swift.Void)? = nil) {
        let scaleFactor = min(toRect.width / rectTofocus.width, toRect.height / rectTofocus.height)
        
        UIView.animate(withDuration: duration, delay: 0, options: options, animations: {
            self.transform = CGAffineTransform.init(scaleX: scaleFactor, y: scaleFactor)
            self.frame.origin = CGPoint.init(x: -rectTofocus.minX * scaleFactor + (toRect.width - rectTofocus.width * scaleFactor) / 2.0, y: -rectTofocus.minY * scaleFactor + (toRect.height - rectTofocus.height * scaleFactor) / 2.0)
            }, completion:completion)
    }
}
