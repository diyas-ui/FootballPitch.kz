//
//  ProfileViewController.swift
//  FootballPitch.kz
//
//  Created by Sharapat Azamat on 22.04.2022.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {
    
    let viewModel = ProfileViewModel()
    
    // MARK: - UI Elements
    fileprivate var topView = UIView()
    fileprivate lazy var savedView = StandardShadowView()
    fileprivate lazy var editView = StandardShadowView()
    
    fileprivate lazy var savedIconView: UIImageView = {
        $0.image = UIImage(named: "save_icon")
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView())
    
    fileprivate lazy var savedRightArrowImage: UIImageView = {
        $0.image = UIImage(named: "right_arrow")
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView())
    
    fileprivate lazy var rightArrowImage: UIImageView = {
        $0.image = UIImage(named: "right_arrow")
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView())

    
    fileprivate lazy var savedTitleLabel: UILabel = {
        $0.font = .regularPoppins(18)
        $0.textColor = .palette(.black900)
        $0.text = "Saved"
        return $0
    }(UILabel())
    
    fileprivate lazy var editIcon: UIImageView = {
        $0.image = UIImage(named: "edit_icon")
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView())
    
    fileprivate lazy var editTitleLabel: UILabel = {
        $0.font = .regularPoppins(18)
        $0.textColor = .palette(.black900)
        $0.text = "Edit profile"
        return $0
    }(UILabel())
    
    fileprivate lazy var iconImageView: UIImageView = {
        $0.image = UIImage(named: "icon_image")
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView())
    
    fileprivate lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .regularPoppins(18)
        label.textColor = .palette(.white)
        label.textAlignment = .center
        return label
    }()
    
    fileprivate lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.font = .regularPoppins(14)
        label.textColor = .palette(.white)
        label.textAlignment = .center
        return label
    }()
    
    fileprivate lazy var mailLabel: UILabel = {
        let label = UILabel()
        label.font = .regularPoppins(14)
        label.textColor = .palette(.white)
        label.textAlignment = .center
        return label
    }()
    
    fileprivate lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [iconImageView, nameLabel, phoneLabel, mailLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.spacing = 8
        return stackView
    }()
    
    fileprivate lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .semiboldPoppins(24)
        label.textColor = .palette(.white)
        label.text = "My Profile"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        getPlayer()
    }
}

//MARK: - Actions
extension ProfileViewController {
    @objc func exitClicked() {
        do {
            try FirebaseAuth.Auth.auth().signOut()
            openLoginPage()
        }
        catch {
            showMessage(title: "Error", message: "Something went wrong")
        }
    }
    
    private func openLoginPage() {
        if let window = UIApplication.shared.keyWindow {
            let vc = LoginViewController(with: .login)
            window.rootViewController = vc
            UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
            window.makeKeyAndVisible()
        }
    }
    
    @objc func editClicked() {
        let vc = EditProfileViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - Methods
extension ProfileViewController {
    private func getPlayer() {
        viewModel.getPlayer { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.setUser()
            }
        }
    }
    
    private func setUser() {
        nameLabel.text = viewModel.player?.name
        phoneLabel.text = viewModel.player?.phone
        mailLabel.text = viewModel.player?.email
    }
    
    private func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(alert, animated: true)
    }
}

extension ProfileViewController: CodeDesignable {
    
    func setupViews() {
        topView.addSubview(mainStackView)
        
        [savedIconView, savedTitleLabel, savedRightArrowImage].forEach {
            savedView.addSubview($0)
        }
        
        [editIcon, editTitleLabel, rightArrowImage].forEach {
            editView.addSubview($0)
        }
        
        view.backgroundColor = .palette(.white)
        
        [topView, savedView, editView].forEach {
            view.addSubview($0)
        }

        editView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(editClicked)))
        
        setupTopView()
        setupNavigationBar()
        setupConstraints()
    }
    
    func setupNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "exit_icon"), style: .plain, target: self, action: #selector(exitClicked))
    }
    
    func setupConstraints() {
        
        topView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.right.left.equalToSuperview()
            $0.height.equalTo(208)
        }
        
        savedView.snp.makeConstraints {
            $0.top.equalTo(topView.snp.bottom).offset(24)
            $0.left.right.equalToSuperview().inset(25)
            $0.height.equalTo(60)
        }
        
        editView.snp.makeConstraints {
            $0.top.equalTo(savedView.snp.bottom).offset(8)
            $0.left.right.equalToSuperview().inset(25)
            $0.height.equalTo(60)
        }
        
        savedIconView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.left.equalToSuperview().inset(12)
            $0.bottom.equalToSuperview().offset(-10)
        }
        
        savedTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.left.equalTo(savedIconView.snp.right).offset(16)
            $0.bottom.equalToSuperview().offset(-10)
            
        }
        
        savedRightArrowImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.right.equalToSuperview().offset(-20)
            $0.bottom.equalToSuperview()
        }
        
        editIcon.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.left.equalToSuperview().inset(12)
            $0.bottom.equalToSuperview().offset(-10)
        }
        
        editTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.left.equalTo(savedIconView.snp.right).offset(16)
            $0.bottom.equalToSuperview().offset(-10)
            
        }
        
        rightArrowImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.right.equalToSuperview().offset(-20)
            $0.bottom.equalToSuperview()
        }
        
        mainStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(25)
            $0.centerX.equalToSuperview()
        }
    }
    
    func setupTopView() {
        topView.backgroundColor = .palette(.accent)
        topView.roundByCorners(corners: [.bottomRight, .bottomLeft], radius: 16.0)
    }
}
