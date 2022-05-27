//
//  DetailPlayersViewController.swift
//  FootballPitch.kz
//
//  Created by 123456 on 12.05.2022.
//

import UIKit

class DetailPlayersViewController: UIViewController {
    
    public var player: PlayersModel? {
        didSet {
            setPlayer()
        }
    }
    
    private var scrollView = UIScrollView()
    private var scrollContentView = UIView()
    
    private var stackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fill
        view.alignment = .fill
        view.spacing = 8
        view.axis = .vertical
        return view
    }()
    
    private var topView = UIView()
    private var iconImageView: UIImageView = {
        $0.image = UIImage(named: "icon_image")
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView())
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .semiboldPoppins(18)
        label.textColor = .palette(.white)
        label.textAlignment = .center
        return label
    }()
    
    private var contactsLabel: UILabel = {
        let label = UILabel()
        label.font = .regularPoppins(14)
        label.textColor = .palette(.black900)
        label.text = "Contacts"
        return label
    }()
    
    private var contactsStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [])
        view.backgroundColor = .palette(.white)
        view.distribution = .fill
        view.alignment = .fill
        view.spacing = 0
        view.axis = .vertical
        return view
    }()
    
    private var physicalDatasLabel: UILabel = {
        let label = UILabel()
        label.font = .regularPoppins(14)
        label.textColor = .palette(.black900)
        label.text = "Physical datas"
        return label
    }()
    
    private var physicalDatasStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [])
        view.backgroundColor = .palette(.white)
        view.distribution = .fill
        view.alignment = .fill
        view.spacing = 0
        view.axis = .vertical
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
}

//MARK: - Methods
extension DetailPlayersViewController {
    func setPlayer() {
        guard let player = player else {
            return
        }
        
        if let name = player.name {
            nameLabel.text = name
        }
        
        iconImageView.image = UIImage(named: "icon_image")
        
        if let email = player.email {
            let emailField = LeftRightLabelsView()
            emailField.leftTitle = "Email"
            emailField.rightTitle = email
            contactsStackView.addArrangedSubview(emailField)
        }
        
        if let phone = player.phone {
            let phoneField = LeftRightLabelsView()
            phoneField.leftTitle = "Phone"
            phoneField.rightTitle = phone
            contactsStackView.addArrangedSubview(phoneField)
        }
        
        if let positions = player.positions {
            let positionsField = LeftRightLabelsView()
            positionsField.leftTitle = "Position(s)"
            
            var text: String = ""
            for (index, value) in positions.enumerated() {
                if index == 0 {
                    text += value
                } else {
                    text += ", \(value)"
                }
            }
            
            positionsField.rightTitle = text
            physicalDatasStackView.addArrangedSubview(positionsField)
        }
        
        if let skillLevel = player.skillLevel {
            let skillLevelField = LeftRightLabelsView()
            skillLevelField.leftTitle = "Skill level"
            skillLevelField.rightTitle = skillLevel
            physicalDatasStackView.addArrangedSubview(skillLevelField)
        }
        
        if let strongFoot = player.strongFoot {
            let strongFootField = LeftRightLabelsView()
            strongFootField.leftTitle = "Strong foot"
            strongFootField.rightTitle = strongFoot
            physicalDatasStackView.addArrangedSubview(strongFootField)
        }
        
        if let height = player.height {
            let heightField = LeftRightLabelsView()
            heightField.leftTitle = "Height(cm)"
            heightField.rightTitle = "\(height)"
            physicalDatasStackView.addArrangedSubview(heightField)
        }
        
        if let weight = player.weight {
            let weightField = LeftRightLabelsView()
            weightField.leftTitle = "Weight(kg)"
            weightField.rightTitle = "\(weight)"
            physicalDatasStackView.addArrangedSubview(weightField)
        }
    }
}

//MARK: - CodeDesignable
extension DetailPlayersViewController: CodeDesignable {
    func setupViews() {
        scrollView.alwaysBounceVertical = true
        view.backgroundColor = .palette(.lightGrey)

        [topView, iconImageView, nameLabel, scrollView].forEach {
            view.addSubview($0)
        }
        
        scrollView.addSubview(scrollContentView)
        scrollContentView.addSubview(stackView)
        
        [contactsLabel, contactsStackView, physicalDatasLabel, physicalDatasStackView].forEach {
            stackView.addArrangedSubview($0)
        }
        
        setupTopView()
        setupStackViews()
        setupConstraints()
    }
    
    func setupTopView() {
        topView.backgroundColor = .palette(.accent)
        topView.roundByCorners(corners: [.bottomRight, .bottomLeft], radius: 16.0)
    }
    
    func setupStackViews() {
        stackView.setCustomSpacing(24, after: contactsStackView)
        [contactsStackView, physicalDatasStackView].forEach {
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 8
        }
    }
    
    func setupConstraints() {
        topView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.right.left.equalToSuperview()
            $0.height.equalTo(156)
        }
        
        iconImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(4)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(100)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(iconImageView.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.right.left.equalToSuperview().inset(16)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(topView.snp.bottom).offset(24)
            $0.right.left.bottom.equalToSuperview()
        }
        
        scrollContentView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.bottom.equalToSuperview()
            $0.width.equalTo(scrollView.snp.width)
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.right.left.equalToSuperview().inset(24)
            $0.bottom.equalToSuperview().offset(-16)
        }
    }
}
