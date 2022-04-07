//
//  UIColor+Extension.swift
//  FootballPitch.kz
//
//  Created by Akzhol Imangazin on 6/24/21.
//

import Foundation
import UIKit
public extension UIColor {
    static func fromRgb(rgb:Int, alpha: CGFloat = 1.0) -> UIColor{
        return UIColor(red: (CGFloat((rgb&0xFF0000) >> 16))/255.0, green: (CGFloat((rgb&0xFF00) >> 8))/255.0, blue: (CGFloat(rgb&0xFF))/255.0, alpha: alpha)
    }
}

