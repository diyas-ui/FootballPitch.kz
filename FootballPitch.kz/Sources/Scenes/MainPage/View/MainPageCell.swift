//
//  MainPageCell.swift
//  FootballPitch.kz
//
//  Created by 123456 on 08.04.2022.
//

import UIKit

class MainPageCell: UITableViewCell {
    private var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .palette(.white)
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        return view
    }()
    
    private var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .semiboldPoppins(14)
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
    
    private var distanceLabel: UILabel = {
        let label = UILabel()
        label.font = .regularPoppins(12)
        label.textColor = .palette(.black800)
        return label
    }()
    
    private var addressLabel: UILabel = {
        let label = UILabel()
        label.font = .regularPoppins(12)
        label.textColor = .palette(.black800)
        return label
    }()
    
    private var bookButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.palette(.accent)
        button.setTitleColor(.palette(.white), for: .normal)
        button.titleLabel?.font = .semiboldPoppins(12)
        button.clipsToBounds = true
        button.layer.cornerRadius = 4
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(object: FieldsModel) {
        iconImageView.image = object.icon
        titleLabel.text = object.title
        addressLabel.text = object.address
        bookButton.setTitle("Book now", for: .normal)
        
        if let rating = object.rating {
            ratingImageView.image = UIImage(named: "rating")
            ratingLabel.text = "\(rating)"
        }
        
        if let distance = object.distance {
            distanceImageView.image = UIImage(named: "location")
            distanceLabel.text = "\(distance)"
        }
        
        if let isFavorite = object.isFavorite {
            if !isFavorite {
                favoriteImageView.image = UIImage(named: "not_favorite")
            }
        }
    }
}

//MARK: - CodeDesignable
extension MainPageCell: CodeDesignable {
    func setupViews() {
        backgroundColor = .clear
        
        addSubview(containerView)
        [iconImageView, titleLabel, ratingImageView, ratingLabel, favoriteImageView, distanceImageView, distanceLabel, addressLabel, bookButton].forEach {
            containerView.addSubview($0)
        }
        
        setupConstraints()
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(4)
            $0.right.left.equalToSuperview().inset(16)
        }
        
        iconImageView.snp.makeConstraints {
            $0.top.bottom.left.equalToSuperview().inset(8)
            $0.width.equalTo(92)
            $0.height.equalTo(124)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(8)
            $0.left.equalTo(iconImageView.snp.right).offset(16)
        }
        
        ratingImageView.snp.makeConstraints {
            $0.top.equalTo(11)
            $0.left.equalTo(titleLabel.snp.right).offset(8)
            $0.size.equalTo(12)
        }
        
        ratingLabel.snp.makeConstraints {
            $0.centerY.equalTo(ratingImageView)
            $0.left.equalTo(ratingImageView.snp.right).offset(2)
            $0.width.equalTo(19)
        }
        
        favoriteImageView.snp.makeConstraints {
            $0.top.equalTo(8)
            $0.right.equalTo(-8)
            $0.size.equalTo(24)
        }
        
        distanceImageView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.left.equalTo(iconImageView.snp.right).offset(16)
            $0.size.equalTo(14)
        }
        
        distanceLabel.snp.makeConstraints {
            $0.centerY.equalTo(distanceImageView)
            $0.left.equalTo(distanceImageView.snp.right).offset(4)
        }
        
        addressLabel.snp.makeConstraints {
            $0.top.equalTo(distanceLabel.snp.bottom).offset(4)
            $0.left.equalTo(iconImageView.snp.right).offset(16)
        }
        
        bookButton.snp.makeConstraints {
            $0.left.equalTo(iconImageView.snp.right).offset(16)
            $0.right.equalTo(-8)
            $0.bottom.equalTo(-8)
            $0.height.equalTo(26)
        }
    }
}
