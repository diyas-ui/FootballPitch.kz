//
//  LoginViewController.swift
//  FootballPitch.kz
//
//  Created by mac on 24.03.2022.
//

import UIKit
import SnapKit

enum PageType {
    case login
    case register
}

class LoginViewController: UIViewController {
    
    private var type: PageType

    private let headerView: LoginAndRegisterHeaderView = {
        let view = LoginAndRegisterHeaderView()

        return view
    }()
    
    private let fillWindowView: FillWindowView = {
        let view = FillWindowView()
        view.layer.cornerRadius = 16
        view.titleString = "Login"
        view.dropShadow()
        
        return view
    }()
    
    private let conditionalTermLabel: UILabel = {
        let label = UILabel()
        label.font = .regularPoppins(12)
        label.textColor = .palette(.black800)
        label.text = "By clicking the Sign up button, I agree to the\n terms and conditions of Football Pitch."
        label.numberOfLines = 0
        label.textAlignment = .center

        return label
    }()
    
    private let bottomLabel = UILabel()

    init(with type: PageType) {
        self.type = type

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
}

//MARK: - ButtonHandler
extension LoginViewController {
    @objc
    private func transitionHandler() {
        switch type {
        case .login:
            let registrationVC = LoginViewController(with: .register)
            present(registrationVC, animated: true)
            registrationVC.modalPresentationStyle = .overCurrentContext

        case .register:
            let loginVC = LoginViewController(with: .login)
            present(loginVC, animated: true)
            loginVC.modalPresentationStyle = .fullScreen
        }

        setupViews()
    }
}

//MARK: - CodeDesignable
extension LoginViewController: CodeDesignable {
    func setupViews() {
        switch type {
        case.login:
            [headerView, fillWindowView, bottomLabel].forEach {
                view.addSubview($0)
            }
        case .register:
            [headerView, fillWindowView, conditionalTermLabel, bottomLabel].forEach {
                view.addSubview($0)
            }
        }
        
        view.backgroundColor = .palette(.white)

        setupConstraints()
        setup()
    }

    func setupConstraints() {
        switch type {
        case .register:
            headerView.snp.makeConstraints { make in
                make.top.equalTo(view.safeAreaLayoutGuide)
                make.left.right.equalToSuperview()
                make.height.equalTo(170)
            }
            
            fillWindowView.snp.makeConstraints { make in
                make.top.equalTo(headerView.snp.bottom).offset(25)
                make.left.right.equalToSuperview().inset(25)
            }
            
            conditionalTermLabel.snp.makeConstraints { make in
                make.top.equalTo(fillWindowView.snp.bottom).offset(16)
                make.left.right.equalToSuperview().inset(41)
            }
            
            bottomLabel.snp.makeConstraints { make in
                make.top.equalTo(conditionalTermLabel.snp.bottom).offset(24)
                make.left.right.equalToSuperview().inset(15)
            }

        case .login:
            headerView.snp.makeConstraints { make in
                make.top.equalTo(view.safeAreaLayoutGuide)
                make.left.right.equalToSuperview()
                make.height.equalTo(170)
            }

            fillWindowView.snp.makeConstraints { make in
                make.top.equalTo(headerView.snp.bottom).offset(25)
                make.left.right.equalToSuperview().inset(25)
            }
            
            bottomLabel.snp.makeConstraints { make in
                make.top.equalTo(fillWindowView.snp.bottom).offset(24)
                make.left.right.equalToSuperview().inset(15)
            }
        }
    }
    
    private func setup() {
        switch type {
        case .login:
            fillWindowView.firstTextString = "Phone Number"
            fillWindowView.firstTextPlaceholder = "+7(7XX)XXX-XX-XX"
            fillWindowView.secondTextPlaceholder = ""
            fillWindowView.secondTextString = "Password"
            fillWindowView.titleString = "Login"
            fillWindowView.isSecurityKeyboard = true
            fillWindowView.titleButtonString = "Log in"
            fillWindowView.isHiddenForgotPassword = false
            
            let attributedText = NSMutableAttributedString()
            attributedText.append(NSAttributedString(
                string: "New to Football Pitch?",
                attributes: [NSAttributedString.Key.font : UIFont.regularPoppins(14),
                             NSAttributedString.Key.foregroundColor : UIColor.palette(.black800)]))
            attributedText.append(NSAttributedString(
                string: "  Sign up now",
                attributes: [NSAttributedString.Key.font : UIFont.semiboldPoppins(14),
                             NSAttributedString.Key.foregroundColor : UIColor.palette(.accent)]))
            bottomLabel.attributedText = attributedText
            bottomLabel.textAlignment = .center
            

        case .register:
            fillWindowView.firstTextString = "Full name"
            fillWindowView.firstTextPlaceholder = ""
            fillWindowView.secondTextString = "Email"
            fillWindowView.secondTextPlaceholder = "example@gmail.com"
            fillWindowView.titleString = "Sign Up"
            fillWindowView.isHiddenForgotPassword = true
            fillWindowView.isSecurityKeyboard = false
            fillWindowView.titleButtonString = "Sign Up"
            fillWindowView.remakeConstraints()
            
            let attributedText = NSMutableAttributedString()
            attributedText.append(NSAttributedString(
                string: "Already have an account?",
                attributes: [NSAttributedString.Key.font : UIFont.regularPoppins(14),
                             NSAttributedString.Key.foregroundColor : UIColor.palette(.black800)]))
            attributedText.append(NSAttributedString(
                string: "  Login now",
                attributes: [NSAttributedString.Key.font : UIFont.semiboldPoppins(14),
                             NSAttributedString.Key.foregroundColor : UIColor.palette(.accent)]))
            bottomLabel.attributedText = attributedText
            bottomLabel.textAlignment = .center
        }

        bottomLabel.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(transitionHandler))
        bottomLabel.addGestureRecognizer(tapGesture)
    }
}
