//
//  UIView+Extension.swift
//  FootballPitch.kz
//
//  Created by Akzhol Imangazin on 6/24/21.
//

import Foundation
import UIKit

extension UIView {

    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = .palette(.black900)
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowRadius = 10
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
