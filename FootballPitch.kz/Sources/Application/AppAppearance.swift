//
//  AppAppearance.swift
//  FootballPitch.kz
//
//  Created by 123456 on 13.04.2022.
//

import UIKit
import MaterialComponents

final class AppAppearance {
    static func setupAppearance() {
        UINavigationBar.appearance().backgroundColor = .palette(.accent)
        UINavigationBar.appearance().shadowImage = UIImage()
        
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font : UIFont.regularPoppins(18), NSAttributedString.Key.foregroundColor : UIColor.palette(.white)]
        
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().tintColor = .palette(.white)
    
        UINavigationBar.appearance().backIndicatorImage = UIImage(named: "left_arrow")
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(named: "left_arrow")
    }
}

extension MDCBaseTextField {
    func setNormalLabelColorForAllStates(_ color: UIColor) {
        self.setNormalLabelColor(color, for: .normal)
        self.setNormalLabelColor(color, for: .editing)
        self.setNormalLabelColor(color, for: .disabled)
    }
    
    func setLeadingAssistiveLabelColorForAllStates(_ color: UIColor) {
        setLeadingAssistiveLabelColor(color, for: .normal)
        setLeadingAssistiveLabelColor(color, for: .editing)
        setLeadingAssistiveLabelColor(color, for: .disabled)
    }
    
    func setFloatingLabelColorForAllStates(_ color: UIColor) {
        self.setFloatingLabelColor(color, for: .normal)
        self.setFloatingLabelColor(color, for: .editing)
        self.setFloatingLabelColor(color, for: .disabled)
    }
    
    func setTextColorAllStates(_ color: UIColor) {
        self.setTextColor(color, for: .normal)
        self.setTextColor(color, for: .editing)
        self.setTextColor(color, for: .disabled)
    }
}

// MARK: Additional Placeholder
extension MDCOutlinedTextField {
    private var placeholderLabelTag: Int {
        888
    }
    
    func addAdditionalPlaceholder(with attributedText: NSAttributedString) {
        guard viewWithTag(placeholderLabelTag) == nil else {
            viewWithTag(placeholderLabelTag)?.isHidden = false
            return
        }
        let placeholerLabel = UILabel(frame: self.frame)
        placeholerLabel.tag = placeholderLabelTag
        placeholerLabel.clipsToBounds = true
        placeholerLabel.attributedText = attributedText
        
        addSubview(placeholerLabel)
        
        placeholerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            placeholerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            placeholerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 12),
            placeholerLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            placeholerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12)
        ])
        bringSubviewToFront(placeholerLabel)
    }
    
    func addTrailingImage(image: UIImage?, tintColor: UIColor? = nil, transform: CGAffineTransform? = nil) {
        let imageWidth: CGFloat = 24
        let imageHeight = frame.height
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: imageWidth, height: imageHeight))
        imageView.transform = transform ?? CGAffineTransform.identity
        imageView.image = image?.withRenderingMode(.alwaysTemplate)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = tintColor ?? .palette(.black800)
        
        let widthConstraint = imageView.widthAnchor.constraint(equalToConstant: imageWidth)
        imageView.addConstraint(widthConstraint)

        trailingViewMode = .always
        trailingView = imageView
    }
    
    func isAdditionalPlaceholderHidden() -> Bool? {
        guard let placeholderLabel = viewWithTag(placeholderLabelTag) else {
            return nil
        }
        return placeholderLabel.isHidden
    }
    
    func showAdditionalPlaceholder() {
        guard let placeholderLabel = viewWithTag(placeholderLabelTag) else {
            return
        }
        placeholderLabel.isHidden = false
    }
    
    func hideAdditionalPlaceholder() {
        guard let placeholderLabel = viewWithTag(placeholderLabelTag) else {
            return
        }
        placeholderLabel.isHidden = true
    }
}
