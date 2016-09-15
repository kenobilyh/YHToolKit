//
//  UIColor+ColorSets.swift
//  YHToolKit
//
//  Created by Jeff Lin on 9/15/16.
//  Copyright © 2016 JeffLin. All rights reserved.
//

import UIKit

extension UIColor {
    open class var redCMYK: UIColor {
        return UIColor.init(red: 230.0 / 255.0, green: 0.0 / 255.0, blue: 18.0/255.0, alpha: 1.0)
    }
    
    open class var yellowCMYK: UIColor {
        return UIColor.init(red: 255.0 / 255.0, green: 251.0 / 255.0, blue: 0.0/255.0, alpha: 1.0)
    }
    
    open class var greenCMYK: UIColor {
        return UIColor.init(red: 0.0 / 255.0, green: 153.0 / 255.0, blue: 68.0/255.0, alpha: 1.0)
    }
    
    open class var blueCMYK: UIColor {
        return UIColor.init(red: 0.0 / 255.0, green: 160.0 / 255.0, blue: 233.0/255.0, alpha: 1.0)
    }
    
    open class var systemBlue: UIColor {
        return UIColor.init(red: 0.0 / 255.0, green: 127.0 / 255.0, blue: 255.0/255.0, alpha: 1.0)
    }
    
    open class var systemRedCMYK: UIColor {
        return UIColor.init(red: 255.0 / 255.0, green: 59.0 / 255.0, blue: 48.0/255.0, alpha: 1.0)
    }
}
