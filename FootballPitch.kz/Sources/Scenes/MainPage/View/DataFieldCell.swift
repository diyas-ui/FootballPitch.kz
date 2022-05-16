//
//  DataFieldCell.swift
//  FootballPitch.kz
//
//  Created by 123456 on 15.05.2022.
//

import UIKit

class DataFieldCell: UICollectionViewCell {
    public var field: FieldsModel? {
        didSet {
            setField()
        }
    }
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .semiboldPoppins(18)
        label.textColor = .palette(.black900)
        return label
    }()
    
    private var ratingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var ratingLabel: UILabel = {
        let label = UILabel()
        label.font = .mediumPoppins(12)
        label.textColor = .palette(.black900)
        return label
    }()
    
    private var favoriteImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var distanceImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var addressLabel: UILabel = {
        let label = UILabel()
        label.font = .regularPoppins(12)
        label.textColor = .palette(.black800)
        return label
    }()
    
    private var phoneImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var phoneLabel: UILabel = {
        let label = UILabel()
        label.font = .regularPoppins(12)
        label.textColor = .palette(.accent)
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .regularPoppins(14)
        label.textColor = .palette(.black800)
        label.textAlignment = .left
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

//MARK: - Methods
extension DataFieldCell {
    func setField() {
        guard let field = field else {
            return
        }
        
        if let title = field.title {
            titleLabel.text = title
        }
        
        if let rating = field.rating {
            ratingImageView.image = UIImage(named: "rating")
            ratingLabel.text = "\(rating)"
        }
        
        if let isFavorite = field.isFavorite {
            if !isFavorite {
                favoriteImageView.image = UIImage(named: "not_favorite")
            }
        }
        
        if let address = field.address {
            distanceImageView.image = UIImage(named: "location")
            addressLabel.text = address
        }
        
        if let phone = field.phone {
            phoneImageView.image = UIImage(named: "phone")
            phoneLabel.text = phone
        }
        
        if let description = field.description {
            descriptionLabel.text = description
            remakeConstraints()
        }
    }
}

//MARK: - CodeDesignable
extension DataFieldCell: CodeDesignable {
    func setupViews() {
        [titleLabel, ratingImageView, ratingLabel, favoriteImageView, distanceImageView, addressLabel, phoneImageView, phoneLabel, descriptionLabel].forEach {
            addSubview($0)
        }
        
        setupConstraints()
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.left.equalToSuperview().offset(16)
        }
        
        ratingImageView.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.left.equalTo(titleLabel.snp.right).offset(8)
            $0.size.equalTo(12)
        }
        
        ratingLabel.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.left.equalTo(ratingImageView.snp.right).offset(2)
            $0.width.equalTo(19)
        }
        
        favoriteImageView.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.right.equalTo(-8)
            $0.size.equalTo(24)
        }
        
        distanceImageView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.left.equalToSuperview().offset(16)
            $0.size.equalTo(14)
        }
        
        addressLabel.snp.makeConstraints {
            $0.centerY.equalTo(distanceImageView)
            $0.left.equalTo(distanceImageView.snp.right).offset(4)
        }
        
        phoneImageView.snp.makeConstraints {
            $0.top.equalTo(distanceImageView.snp.bottom).offset(8)
            $0.left.equalToSuperview().offset(16)
            $0.size.equalTo(14)
            $0.bottom.equalToSuperview().offset(-16)
        }

        phoneLabel.snp.makeConstraints {
            $0.centerY.equalTo(phoneImageView)
            $0.left.equalTo(phoneImageView.snp.right).offset(4)
        }
    }
    
    func remakeConstraints() {
        phoneImageView.snp.remakeConstraints {
            $0.top.equalTo(distanceImageView.snp.bottom).offset(8)
            $0.left.equalToSuperview().offset(16)
            $0.size.equalTo(14)
        }
        
        descriptionLabel.snp.remakeConstraints {
            $0.top.equalTo(phoneImageView.snp.bottom).offset(18)
            $0.right.left.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().offset(-16)
        }
    }
}
