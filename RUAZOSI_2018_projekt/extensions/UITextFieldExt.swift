//
//  UITextFieldExt.swift
//  RUAZOSI_2018_projekt
//
//  Created by Lea Rački on 08/07/2018.
//  Copyright © 2018 Lea Rački. All rights reserved.
//

import UIKit

extension UITextField {
    func jitter(){
        let animation = CABasicAnimation(keyPath: "position")
        
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        
        animation.fromValue = NSValue(cgPoint: CGPoint.init(x: self.center.x - 5.0, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint.init(x: self.center.x + 5.0, y: self.center.y))
        
        layer.add(animation, forKey: "position")
    }
}
