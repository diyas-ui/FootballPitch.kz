//
//  FillWindowView.swift
//  FootballPitch.kz
//
//  Created by mac on 29.03.2022.
//

import Foundation
import SnapKit
import MaterialComponents
import UIKit
import SwiftUI

class FillWindowView: UIView {

    var titleString: String? {
        didSet {
            guard let titleString = titleString else { return }
            titleLabel.text = titleString
        }
    }
    
    var secondTextString: String? {
        didSet {
            guard let secondTextString = secondTextString else { return }
            secondTextField.label.text = secondTextString
        }
    }
    
    var firstTextString: String? {
        didSet {
            guard let firstTextString = firstTextString else { return }
            firstTextField.label.text = firstTextString
        }
    }
    
    var secondTextPlaceholder: String? {
        didSet {
            guard let secondTextPlaceholder = secondTextPlaceholder else { return }
            secondTextField.placeholder = secondTextPlaceholder
        }
    }
    
    var firstTextPlaceholder: String? {
        didSet {
            guard let firstTextPlaceholder = firstTextPlaceholder else { return }
            firstTextField.placeholder = firstTextPlaceholder
        }
    }
    
    var isHiddenForgotPassword: Bool? {
        didSet {
            guard let isHiddenForgotPassword = isHiddenForgotPassword else { return }
            forgotPasswordButton.isHidden = isHiddenForgotPassword
        }
    }

    var titleButtonString: String? {
        didSet {
            guard let titleButtonString = titleButtonString else { return }
            enterButton.setTitle(titleButtonString, for: .normal)
        }
    }
    
    var isSecurityKeyboard: Bool? {
        didSet {
            guard let isSecurityKeyboard = isSecurityKeyboard else { return }
            secondTextField.isSecureTextEntry = isSecurityKeyboard
        }
    }

    private let containerView = StandardShadowView()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .palette(.black900)
        label.font = .semiboldPoppins(24)

        return label
    }()
    
    private let firstTextField: MDCOutlinedTextField = {
        let textField = MDCOutlinedTextField(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        textField.setOutlineColor(.palette(.lightGrey), for: .normal)
        textField.setOutlineColor(.palette(.lightGrey), for: .editing)
        textField.sizeToFit()

        return textField
    }()
    
    private let secondTextField: MDCOutlinedTextField = {
        let textField = MDCOutlinedTextField(frame: CGRect(x: 0, y: 0, width: 296, height: 46))
        textField.setOutlineColor(.palette(.lightGrey), for: .normal)
        textField.setOutlineColor(.palette(.lightGrey), for: .editing)
        textField.sizeToFit()

        return textField
    }()
    
    private let forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot Password?", for: .normal)
        button.setTitleColor(.palette(.black800), for: .normal)
        button.backgroundColor = .clear

        return button
    }()
    
    private let enterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.palette(.white), for: .normal)
        button.backgroundColor = .palette(.accent)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)

        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Methods
extension FillWindowView {
    
    @objc func buttonClicked() {
        self.window?.rootViewController = MainTabBarController()
    }
}

//MARK: - CodeDesignable
extension FillWindowView: CodeDesignable {
    func setupViews() {
        
        addSubview(containerView)
        
        [titleLabel,
         firstTextField,
         secondTextField,
         forgotPasswordButton,
         enterButton].forEach {
            addSubview($0)
        }
        
        backgroundColor = .clear
        
        setupConstraints()
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.left.equalToSuperview().offset(16)
        }
        
        firstTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(24)
            make.left.right.equalToSuperview().inset(17)
            make.height.equalTo(46)
        }

        secondTextField.snp.makeConstraints { make in
            make.top.equalTo(firstTextField.snp.bottom).offset(25)
            make.left.right.equalToSuperview().inset(17)
            make.height.equalTo(46)
        }
        
        forgotPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(secondTextField.snp.bottom).offset(33)
            make.left.equalToSuperview().offset(16)
            make.height.equalTo(16)
            make.width.equalTo(150)
        }
        
        enterButton.snp.makeConstraints { make in
            make.top.equalTo(forgotPasswordButton.snp.bottom).offset(24)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(48)
            make.bottom.equalToSuperview().inset(32)
        }
    }
    
    func remakeConstraints() {
        enterButton.snp.remakeConstraints { make in
            make.top.equalTo(secondTextField.snp.bottom).offset(35)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(48)
            make.bottom.equalToSuperview().inset(32)
        }
    }
}
