//
//  LoginAndRegisterHeaderView.swift
//  FootballPitch.kz
//
//  Created by mac on 28.03.2022.
//

import UIKit
import SnapKit

class LoginAndRegisterHeaderView: UIView {
    
    private let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "logo_auth")

        return imageView
    }()
    
    private let projectTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .palette(.accent)
        label.text = "Football Pitch"
        label.font = .semiboldPoppins(14)

        return label
    }()
    
    private let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "ball_image")
        
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - CodeDesignble
extension LoginAndRegisterHeaderView: CodeDesignable {

    func setupViews() {
        [logoImage, projectTitleLabel, backgroundImage].forEach {
            addSubview($0)
        }

        backgroundColor = .clear

        setupConstraints()
    }

    func setupConstraints() {
        logoImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(27)
            make.left.equalToSuperview().offset(27)
            make.size.equalTo(20)
        }

        projectTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(10)
            make.left.equalTo(logoImage)
        }

        backgroundImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(-15)
            make.left.equalTo(projectTitleLabel.snp.right).offset(148)
            make.size.equalTo(155)
        }
    }
}
