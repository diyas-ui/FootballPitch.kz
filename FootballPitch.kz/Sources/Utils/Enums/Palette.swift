//
//  Palette.swift
//  FootballPitch.kz
//
//  Created by Akzhol Imangazin on 7/4/21.
//

import UIKit

enum Palette: String {
    case white
    case black
    case mainColor
    case primary
    case midGrey
    case shadowColor
    case monoGray3
    case error
    
    case red900
    case red600
    case red500
    case red300
    case red100
    
    case green600
    case green500
    case green100
    case green50
    
    case blue100
    
    case yellow600
    case yellow500
    case yellow300
    case yellow50
        
    case gray900
    case gray800
    case gray500
    case gray400
    case gray300
    case gray200
    case gray100
    case gray50
    
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
