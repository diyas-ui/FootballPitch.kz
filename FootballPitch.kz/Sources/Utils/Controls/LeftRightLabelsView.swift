//
//  LeftRightLabelsView.swift
//  FootballPitch.kz
//
//  Created by 123456 on 14.05.2022.
//

import UIKit

class LeftRightLabelsView: UIView {
    
    public var leftTitle: String? {
        didSet {
            leftLabel.text = leftTitle
        }
    }
    
    public var rightTitle: String? {
        didSet {
            rightLabel.text = rightTitle
        }
    }

    private var leftLabel: UILabel = {
        let label = UILabel()
        label.font = .regularPoppins(14)
        label.textColor = .palette(.black800)
        label.textAlignment = .left
        return label
    }()
    
    private var rightLabel: UILabel = {
        let label = UILabel()
        label.font = .mediumPoppins(14)
        label.textColor = .palette(.black900)
        label.textAlignment = .right
        label.numberOfLines = 0
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

//MARK: - CodeDesignble
extension LeftRightLabelsView: CodeDesignable {
    func setupViews() {
        backgroundColor = .clear
        
        addSubview(leftLabel)
        addSubview(rightLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        leftLabel.snp.makeConstraints {
            $0.top.left.equalToSuperview().offset(10)
            $0.width.equalTo((Constants.screenWidth / 2) - 40)
        }
        
        rightLabel.snp.makeConstraints {
            $0.top.right.bottom.equalToSuperview().inset(10)
            $0.width.equalTo((Constants.screenWidth / 2) - 34)
        }
    }
}
