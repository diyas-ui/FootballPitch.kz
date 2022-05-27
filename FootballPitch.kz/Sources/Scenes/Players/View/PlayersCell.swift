//
//  PlayersCell.swift
//  FootballPitch.kz
//
//  Created by 123456 on 12.05.2022.
//

import UIKit

class PlayersCell: UITableViewCell {
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
        label.textAlignment = .left
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .regularPoppins(13)
        label.textColor = .palette(.black800)
        label.textAlignment = .left
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(object: PlayersModel) {
        iconImageView.image = UIImage(named: "icon_image")
        titleLabel.text = object.name
        
        var text: String = ""
        if let positions = object.positions {
            for (index, value) in positions.enumerated() {
                if index == 0 {
                    text += value
                } else {
                    text += ", \(value)"
                }
            }
            
            descriptionLabel.text = text
        }
    }
}

//MARK: - CodeDesignable
extension PlayersCell: CodeDesignable {
    func setupViews() {
        selectionStyle = .none
        backgroundColor = .clear
        
        addSubview(containerView)
        [iconImageView, titleLabel, descriptionLabel].forEach {
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
            $0.top.bottom.left.equalToSuperview().inset(12)
            $0.size.equalTo(56)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(12)
            $0.left.equalTo(iconImageView.snp.right).offset(16)
            $0.right.equalToSuperview().offset(-16)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.left.equalTo(iconImageView.snp.right).offset(16)
            $0.right.equalToSuperview().offset(-16)
        }
    }
}
