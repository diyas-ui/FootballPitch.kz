//
//  UIFont+Extension.swift
//  FootballPitch.kz
//
//  Created by Akzhol Imangazin on 6/24/21.
//

import Foundation
import UIKit

extension UIFont {
    static public func regularPoppins(_ size: CGFloat) -> UIFont {
        return UIFont.init(name: "Poppins-Regular", size: size)!
    }
    
    static public func mediumPoppins(_ size: CGFloat) -> UIFont {
        return UIFont.init(name: "Poppins-Medium", size: size)!
    }
    
    static public func semiboldPoppins(_ size: CGFloat) -> UIFont {
        return UIFont.init(name: "Poppins-SemiBold", size: size)!
    }
    
    static public func boldPoppins(_ size: CGFloat) -> UIFont {
        return UIFont.init(name: "Poppins-Bold", size: size)!
    }
}
