//
//  BookingViewController.swift
//  FootballPitch.kz
//
//  Created by mac on 24.05.2022.
//

import UIKit

class BookingViewController: UIViewController {

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .regularPoppins(18)
        label.textColor = .palette(.white)
        label.text = "Book a field"
        return label
    }()

    private var topView = UIView()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.clipsToBounds = true
        button.layer.cornerRadius = 12
        button.setImage(UIImage(named: "left_arrow"), for: .normal)
        button.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
        return button
    }()
    
    private var monthChooseView: MonthChooseView = {
        let view = MonthChooseView()

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        hideNavBar(hide: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        hideNavBar(hide: false)
    }
}

//MARK: - Actions
extension BookingViewController {
    @objc func backButtonClicked() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func bookButtonClicked() {
        print(#function)
    }
}

//MARK: - CodeDesignable
extension BookingViewController: CodeDesignable {
    func setupViews() {
        view.backgroundColor = .palette(.lightGrey)

        [topView, monthChooseView].forEach {
            view.addSubview($0)
        }
        
        topView.addSubview(backButton)
        topView.addSubview(titleLabel)
        
        setupConstraints()
        setupTopView()
    }
    
    func setupConstraints() {
        topView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.right.left.equalToSuperview()
            $0.height.equalTo(86)
        }
        
        backButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(12)
            $0.left.equalToSuperview().offset(15)
            $0.size.equalTo(24)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(backButton.snp.bottom).offset(8)
            $0.left.equalToSuperview().offset(20)
        }
        
        
        monthChooseView.snp.makeConstraints {
            $0.top.equalTo(topView.snp.bottom).offset(18)
            $0.height.equalTo(25)
            $0.left.right.equalToSuperview()
        }
        
    }
    
    func setupTopView() {
        topView.backgroundColor = .palette(.accent)
        topView.roundByCorners(corners: [.bottomRight, .bottomLeft], radius: 16.0)
    }
}
