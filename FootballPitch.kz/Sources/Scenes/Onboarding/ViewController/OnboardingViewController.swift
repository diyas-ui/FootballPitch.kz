//
//  OnboardingViewController.swift
//  FootballPitch.kz
//
//  Created by Sharapat Azamat on 04.04.2022.
//

import UIKit

class OnboardingViewController: UIViewController {

    // MARK: - UI Elements
    
    fileprivate lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.backgroundColor = UIColor.palette(.accent)
        button.layer.cornerRadius = 12
        button.tintColor = UIColor.palette(.white)
//      button.addTarget(self, action: #selector(), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        // Do any additional setup after loading the view.
    }

}
extension OnboardingViewController: CodeDesignable {
    
    func setupViews() {
        
        view.backgroundColor = UIColor.palette(.white)
        view.addSubview(loginButton)
        setupConstraints()
    }

    func setupConstraints() {
        
        loginButton.snp.makeConstraints() {
            $0.top.equalToSuperview()
            $0.left.right.equalToSuperview().inset(25)
            $0.bottom.equalToSuperview()
        }
    }
}
