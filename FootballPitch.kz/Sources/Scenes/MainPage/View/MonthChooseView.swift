//
//  MonthChooseView.swift
//  FootballPitch.kz
//
//  Created by mac on 24.05.2022.
//

import Foundation
import UIKit

class MonthChooseView: UIView {
    
    private lazy var leftArrowButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.clipsToBounds = true
        button.layer.cornerRadius = 12
        let image = UIImage(named: "left_arrow")?.withTintColor(.palette(.black700), renderingMode: .alwaysTemplate)
        button.setImage(image, for: .normal)
//        button.addTarget(self, action: #selector(#function), for: .touchUpInside)

        return button
    }()
    
    private lazy var rightArrowButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.clipsToBounds = true
        button.layer.cornerRadius = 12
        let image = UIImage(named: "right_arrow")?.withTintColor(.palette(.black700), renderingMode: .alwaysTemplate)
        button.setImage(image, for: .normal)
//        button.addTarget(self, action: #selector(#function), for: .touchUpInside)

        return button
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .mediumPoppins(14)
        label.textColor = .palette(.accent)
        label.text = "March"
        label.contentMode = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - CodeDesignable
extension MonthChooseView: CodeDesignable {
    func setupViews() {
        backgroundColor = .clear
        
        [leftArrowButton, rightArrowButton, titleLabel].forEach {
            addSubview($0)
        }
        
        setupConstraints()
    }
    
    func setupConstraints() {
        leftArrowButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.left.equalToSuperview().offset(25)
            make.size.equalTo(20)
        }
        
        rightArrowButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-25)
            make.size.equalTo(20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    
}
