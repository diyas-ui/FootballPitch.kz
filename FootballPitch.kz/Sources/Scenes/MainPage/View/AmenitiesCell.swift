//
//  AmenitiesCell.swift
//  FootballPitch.kz
//
//  Created by 123456 on 17.05.2022.
//

import UIKit

class AmenitiesCell: UICollectionViewCell {
    public var field: FieldsModel? {
        didSet {
            setField()
        }
    }
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .semiboldPoppins(14)
        label.textColor = .palette(.black900)
        return label
    }()
    
    private var wifiView = ImageWithLabelView()
    private var showerView = ImageWithLabelView()
    private var cafeteriaView = ImageWithLabelView()
    private var parkingView = ImageWithLabelView()
    
    private var workingHourLabel: UILabel = {
        let label = UILabel()
        label.font = .mediumPoppins(12)
        label.textColor = .palette(.black900)
        return label
    }()
    
    private var hourLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .palette(.black800)
        label.font = .regularPoppins(14)
        label.textColor = .palette(.textPrimary)
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.cornerRadius = 4
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
extension AmenitiesCell {
    func setField() {
        guard let field = field else {
            return
        }
        
        titleLabel.text = "Amenities"
        setAmenitiesViews(amenities: field.amenities)
                        
        if let workingFrom = field.workingFrom, let workingTo = field.workingTo {
            workingHourLabel.text = "Working hours"
            hourLabel.text = "From \(workingFrom) to \(workingTo)"
        }
    }
    
    private func setAmenitiesViews(amenities: [Amenities]) {
        wifiView.setView(image: UIImage(named: "wifi"), title: "Free Wifi")
        showerView.setView(image: UIImage(named: "shower"), title: "Shower")
        cafeteriaView.setView(image: UIImage(named: "cafeteria"), title: "Cafeteria")
        parkingView.setView(image: UIImage(named: "parking"), title: "Parking")
        
        amenities.forEach {
            switch $0 {
            case .wifi:
                wifiView.isHidden = false
            case .shower:
                showerView.isHidden = false
            case .cafeteria:
                cafeteriaView.isHidden = false
            case .parking:
                parkingView.isHidden = false
            }
        }
    }
}

//MARK: - CodeDesignable
extension AmenitiesCell: CodeDesignable {
    func setupViews() {
        [titleLabel, wifiView, showerView, cafeteriaView, parkingView, workingHourLabel, hourLabel].forEach {
            addSubview($0)
        }
        
        setupAmenitiesViews()
        setupConstraints()
    }
    
    func setupAmenitiesViews() {
        [wifiView, showerView, cafeteriaView, parkingView].forEach {
            $0.isHidden = true
        }
    }
    
    func setupConstraints() {
        let width = (Constants.screenWidth - 92) / 4
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview().offset(16)
        }
        
        wifiView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.left.equalToSuperview().offset(16)
            $0.width.equalTo(width)
        }
        
        showerView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.left.equalTo(wifiView.snp.right).offset(20)
            $0.width.equalTo(width)
        }
        
        cafeteriaView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.right.equalTo(parkingView.snp.left).offset(-20)
            $0.width.equalTo(width)
        }
        
        parkingView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.right.equalToSuperview().offset(-16)
            $0.width.equalTo(width)
        }
        
        workingHourLabel.snp.makeConstraints {
            $0.centerY.equalTo(hourLabel)
            $0.left.equalToSuperview().offset(16)
        }
        
        hourLabel.snp.makeConstraints {
            $0.top.equalTo(wifiView.snp.bottom).offset(24)
            $0.right.equalToSuperview().offset(-16)
            $0.width.equalTo(155)
            $0.height.equalTo(26)
            $0.bottom.equalToSuperview()
        }
    }
}
