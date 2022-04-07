//
//  OnboardingViewCell.swift
//  FootballPitch.kz
//
//  Created by Sharapat Azamat on 08.04.2022.
//

import Foundation
import UIKit

class OnboardingViewCell: UICollectionViewCell {
    lazy var centerImg: UIImageView = {
        let centerImg = UIImageView()
        centerImg.contentMode = .scaleAspectFit
        return centerImg
    }()
    
    lazy var titleTextLabel: UILabel = {
        let titleTextLabel = UILabel()
        titleTextLabel.textColor  = UIColor.palette(.black900)
        titleTextLabel.numberOfLines = 0
        titleTextLabel.font = .semiboldPoppins(24)
        
        return titleTextLabel
    }()
    
    lazy var descriptionTextLabel: UILabel = {
        let descriptionTextLabel = UILabel()
        descriptionTextLabel.textColor = UIColor.palette(.black900)
        descriptionTextLabel.textAlignment = .center
        descriptionTextLabel.numberOfLines = 0
        return descriptionTextLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Methods
extension OnboardingViewCell {
    func setCell(object: OnboardingStruct) {
        centerImg.image = UIImage(named: object.imageName)
        titleTextLabel.text = object.title
        descriptionTextLabel.text = object.description
    }
}

//MARK: - ConfigUI
extension OnboardingViewCell {
    func configUI() {
        
        [centerImg, titleTextLabel, descriptionTextLabel].forEach { (view) in
            addSubview(view)
        }
        
        makeConstraints()
    }
    
    func makeConstraints() {
        let centerImgViewTopOffset = super.frame.height / 10
        centerImg.snp.makeConstraints {
            $0.top.equalToSuperview().offset(centerImgViewTopOffset)
            $0.right.left.equalToSuperview()
            $0.height.equalTo(250)
        }
        
        titleTextLabel.snp.makeConstraints {
            $0.centerX.equalTo(centerImg)
            $0.top.equalTo(centerImg.snp.bottom).offset(15)
        }
        
        descriptionTextLabel.snp.makeConstraints {
            $0.top.equalTo(titleTextLabel.snp.bottom).offset(16)
            $0.right.equalToSuperview().offset(-30)
            $0.left.equalToSuperview().offset(30)
        }
    }
}
