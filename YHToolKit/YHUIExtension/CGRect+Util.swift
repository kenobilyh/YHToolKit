//
//  CGRect+Util.swift
//  YHToolKit
//
//  Created by Jeff Lin on 7/11/16.
//  Copyright © 2016 JeffLin. All rights reserved.
//

import UIKit

extension CGRect {
    func squarelized() -> CGRect! {
        var newRect: CGRect! = self
        if self.width > self.height{
            newRect.origin.y = self.midY - self.width / 2.0
            newRect.size.height = self.width
            return newRect
        } else {
            var newRect: CGRect! = self
            newRect.origin.x = self.midX - self.height / 2.0
            newRect.size.width = self.height
            return newRect
        }
    }
}
