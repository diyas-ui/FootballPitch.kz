//
//  Palette.swift
//  FootballPitch.kz
//
//  Created by Akzhol Imangazin on 7/4/21.
//

import UIKit

enum Palette: String {
    case accent
    case primaryDark
    case success
    case warning
    case white
    case error
    case textPrimary
    case textSecondary
    case textSecondaryBlack
    case lightGreen
    case lightGrey
    
    case black900
    case black800
    case black700
    case black600
    
    var color: UIColor {
        return UIColor(named: rawValue, in: .main, compatibleWith: nil)!
    }
    
    var cgColor: CGColor {
        return color.cgColor
    }
}

extension UIColor {
    
    static func palette(_ palette: Palette) -> UIColor {
        return palette.color
    }
}

extension CGColor {
    
    static func palette(_ palette: Palette) -> CGColor {
        return palette.cgColor
    }
}
