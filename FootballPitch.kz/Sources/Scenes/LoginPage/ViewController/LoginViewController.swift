//
//  LoginViewController.swift
//  FootballPitch.kz
//
//  Created by mac on 24.03.2022.
//

import UIKit
import SnapKit
import FirebaseAuth
import FirebaseFirestore

enum PageType {
    case login
    case register
}

class LoginViewController: UIViewController {
    
    public var close: ((PageType) -> Void)?
    
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
        if let close = close {
            close(type)
            dismiss(animated: true, completion: nil)
        } else {
            if type == .login {
                openLoginPage(type: .register)
            } else {
                dismiss(animated: true, completion: nil)
            }
        }
    }
}

//MARK: - Methods
extension LoginViewController {
    private func signUp() {
        guard let email = fillWindowView.firstFieldText, let password = fillWindowView.secondFieldText else {
            return
        }

        self.createUser(email: email, password: password)
    }
    
    private func signIn() {
        guard let email = fillWindowView.firstFieldText, let password = fillWindowView.secondFieldText else {
            return
        }
        
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            guard let self = self else {
                return
            }
            
            guard error == nil else {
                self.showMessage(title: "", message: error?.localizedDescription ?? "")
                return
            }
            
            self.openTabBar()
        }
    }
    
    private func createUser(email: String, password: String) {
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let self = self else {
                return
            }
            
            guard error == nil else {
                self.showMessage(title: "", message: error?.localizedDescription ?? "")
                return
            }
            
            self.addUserToFirestore(email: email, uid: result?.user.uid ?? "")
            self.showMessage(title: "Success", message: "You have successfully registered", withType: true)
        }
    }
    
    private func showMessage(title: String, message: String, withType: Bool = false) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if withType == true {
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                self.openLoginPage(type: .login)
            }))
        } else {
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        }
        present(alert, animated: true)
    }
    
    private func addUserToFirestore(email: String, uid: String) {
        let db = Firestore.firestore()
        
        db.collection("users").document(uid).setData(["email": email])
    }
}

//MARK: - Transition
extension LoginViewController {
    private func openTabBar() {
        if let window = UIApplication.shared.keyWindow {
            let vc = MainTabBarController()
            window.rootViewController = vc
            UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
            window.makeKeyAndVisible()
        }
    }
    
    private func openLoginPage(type: PageType) {
        let vc = LoginViewController(with: type)
        present(vc, animated: true)
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
            fillWindowView.firstTextString = "Email"
            fillWindowView.firstTextPlaceholder = "example@gmail.com"
            fillWindowView.secondTextPlaceholder = "Password"
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
            fillWindowView.firstTextString = "Email"
            fillWindowView.firstTextPlaceholder = "example@gmail.com"
            fillWindowView.secondTextString = "Password"
            fillWindowView.secondTextPlaceholder = "Password"
            fillWindowView.titleString = "Sign Up"
            fillWindowView.isHiddenForgotPassword = false
            fillWindowView.isSecurityKeyboard = true
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

        fillWindowView.enterClicked = { [weak self] in
            switch self?.type {
            case .login:
                self?.signIn()
            case .register:
                self?.signUp()
            default:
                break
            }
        }
        
        bottomLabel.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(transitionHandler))
        bottomLabel.addGestureRecognizer(tapGesture)
    }
}
