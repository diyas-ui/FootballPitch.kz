//
//  ProfileViewController.swift
//  FootballPitch.kz
//
//  Created by Sharapat Azamat on 22.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
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
        label.text = "Rafael Michael"
        return label
    }()
    
    fileprivate lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.font = .regularPoppins(14)
        label.textColor = .palette(.white)
        label.text = "+7 778 555 44 11"
        return label
    }()
    
    fileprivate lazy var mailLabel: UILabel = {
        let label = UILabel()
        label.font = .regularPoppins(14)
        label.textColor = .palette(.white)
        label.text = "rafael@gmail.com"
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
        label.font = .regularPoppins(18)
        label.textColor = .palette(.white)
        label.text = "My Profile"
        return label
    }()
    
    fileprivate lazy var exitButton: UIButton = {
        let button = UIButton()
//        button.addTarget(self, action: #selector(), for: .touchUpInside)
        if let image = UIImage(named: "exit_icon") {
            button.setImage(image, for: .normal)
        }
        return button
    }()
    
    fileprivate lazy var topStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, exitButton])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .top
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViews()
    }
    
}

extension ProfileViewController: CodeDesignable {
    
    func setupViews() {
        
        [topStackView, mainStackView].forEach {
            topView.addSubview($0)
        }
        
        [savedIconView, savedTitleLabel, savedRightArrowImage].forEach {
            savedView.addSubview($0)
        }
        
        [editIcon, editTitleLabel, rightArrowImage].forEach {
            editView.addSubview($0)
        }
        
//        topView.addSubviews(topStackView, mainStackView)
        view.backgroundColor = .palette(.white)
        
        [topView, savedView, editView].forEach {
            view.addSubview($0)
        }
//        view.addSubview(topView)
        setupTopView()
        setupConstraints()
    }
    
    func setupConstraints() {
        
        topView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.right.left.equalToSuperview()
            $0.height.equalTo(252)
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
        
        topStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(25)
            $0.left.right.equalToSuperview().inset(25)
        }
        
        mainStackView.snp.makeConstraints {
            $0.top.equalTo(topStackView.snp.bottom).offset(25)
            $0.centerX.equalToSuperview()
        }
    }
    func setupTopView() {
        topView.backgroundColor = .palette(.accent)
        topView.roundByCorners(corners: [.bottomRight, .bottomLeft], radius: 16.0)
    }
    
    
}
