//
//  LocationMapCell.swift
//  FootballPitch.kz
//
//  Created by 123456 on 17.05.2022.
//

import UIKit

class LocationMapCell: UICollectionViewCell {
    public var field: FieldsModel? {
        didSet {
            setField()
        }
    }
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .semiboldPoppins(14)
        label.textColor = .palette(.black900)
        label.textAlignment = .left
        return label
    }()
    
    // Need to change this image to map
    private var mapView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        // Need to set this corner
//        imageView.layer.cornerRadius = 8
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

//MARK: - Methods
extension LocationMapCell {
    func setField() {
        guard let field = field else {
            return
        }
        
        titleLabel.text = "Location"
        if let latitude = field.latitude, let longitude = field.longitude {
            // Need to set latitude and longitude
            mapView.image = UIImage(named: "map")
        }
    }
}

//MARK: - CodeDesignable
extension LocationMapCell: CodeDesignable {
    func setupViews() {
        backgroundColor = .clear
        
        [titleLabel, mapView].forEach {
            addSubview($0)
        }
        
        setupConstraints()
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24)
            $0.right.left.equalToSuperview().inset(16)
        }
        
        mapView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.right.left.equalToSuperview().inset(16)
            $0.height.equalTo(120)
            $0.bottom.equalToSuperview()
        }
    }
}
