//
//  ImageWithLabelView.swift
//  FootballPitch.kz
//
//  Created by 123456 on 17.05.2022.
//

import UIKit

class ImageWithLabelView: UIView {
    
    private var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .regularPoppins(12)
        label.textColor = .palette(.black800)
        label.textAlignment = .center
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

//MARK: - Methods
extension ImageWithLabelView {
    func setView(image: UIImage?, title: String) {
        iconImageView.image = image ?? UIImage()
        titleLabel.text = title
    }
}

//MARK: - CodeDesignble
extension ImageWithLabelView: CodeDesignable {
    func setupViews() {
        [iconImageView, titleLabel].forEach {
            addSubview($0)
        }

        backgroundColor = .clear

        setupConstraints()
    }

    func setupConstraints() {
        iconImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.size.equalTo(25)
        }

        titleLabel.snp.makeConstraints {
            $0.top.equalTo(iconImageView.snp.bottom).offset(8)
            $0.right.left.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
