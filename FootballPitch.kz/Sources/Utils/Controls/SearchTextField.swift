//
//  SearchTextField.swift
//  FootballPitch.kz
//
//  Created by 123456 on 08.04.2022.
//

import Foundation
import UIKit

class SearchTextField: UITextField {
    var padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    var leftViewPadding: CGFloat = 0
    var rightViewPadding: CGFloat = 0    
    
    var placeHolderAttributed: NSAttributedString? {
        didSet {
            if let placeHolderAttributed = placeHolderAttributed {
                attributedPlaceholder = placeHolderAttributed
            }
        }
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        autocorrectionType = .no
        font = UIFont.regularPoppins(14)
        textColor = .palette(.black900)
        backgroundColor = .palette(.white)
        clipsToBounds = true
        layer.cornerRadius = 8
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        getCalculatedPadding(bounds: bounds)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        getCalculatedPadding(bounds: bounds)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        getCalculatedPadding(bounds: bounds)
    }
    
    override open func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        getCalculatedLeftPadding(bounds: bounds)
    }
    
    override open func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        getCalculatedRightPadding(bounds: bounds)
    }
}

extension SearchTextField {
    func resetViews() {
        leftView = nil
        rightView = nil
    }
    
    func addRightImage(image: UIImage?, size: CGFloat, tintColor: UIColor?) {
        guard let image = image?.withRenderingMode(.alwaysTemplate) else {
            return
        }
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: size, height: size))
        imageView.image = image
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = tintColor
        
        rightViewMode = .always
        rightView = imageView
    }
    
    func addLeftImage(image: UIImage?, size: CGFloat, tintColor: UIColor?) {
        guard let image = image?.withRenderingMode(.alwaysTemplate) else {
            return
        }
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: size, height: size))
        imageView.image = image
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = tintColor
        
        leftViewMode = .always
        leftView = imageView
    }
}

private extension SearchTextField {
    func getCalculatedPadding(bounds: CGRect) -> CGRect {
        let leftWidth = leftView?.bounds.width ?? 0.0
        let rightWidth = rightView?.bounds.width ?? 0.0
        padding.left = (leftWidth + leftViewPadding) + 8
        padding.right = (rightWidth + rightViewPadding)
        return bounds.inset(by: padding)
    }
    
    func getCalculatedLeftPadding(bounds: CGRect) -> CGRect {
        let leftWidth = leftView?.bounds.width ?? 0.0
        return bounds.inset(by: UIEdgeInsets(top: 0, left: leftViewPadding, bottom: 0, right: bounds.width - (leftWidth + leftViewPadding)))
    }
    
    func getCalculatedRightPadding(bounds: CGRect) -> CGRect {
        let rightWidth = rightView?.bounds.width ?? 0.0
        return bounds.inset(by: UIEdgeInsets(top: 0, left: bounds.width - (rightWidth + rightViewPadding), bottom: 0, right: rightViewPadding))
    }
}
