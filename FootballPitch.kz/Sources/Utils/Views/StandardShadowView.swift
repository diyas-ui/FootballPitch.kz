//
//  StandardShadowView.swift
//  FootballPitch.kz
//
//  Created by Sharapat Azamat on 04.04.2022.
//

import Foundation
import UIKit

public class StandardShadowView: CodeDesignableView {

    public var cornerRadius: CGFloat = 8 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

    var shadowRadius: CGFloat = 4 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    
    public var shadowOffset: CGSize = CGSize(width: 0, height: 2) {
        didSet {
            layer.shadowOffset = shadowOffset
        }
    }
    
    var shadowOpacity: Float = 1 {
        didSet {
            layer.shadowOpacity = shadowOpacity
        }
    }
    
    public var shadowColor: UIColor = UIColor.palette(.black900).withAlphaComponent(0.1) {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    public var borderWidth: CGFloat = 1.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    public var borderColor: UIColor = UIColor.fromRgb(rgb: 0x33262626).withAlphaComponent(0.05) {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }

   public override init() {
        super.init()

        backgroundColor = .white
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = false

        layer.shadowOffset = shadowOffset
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
    }
}
