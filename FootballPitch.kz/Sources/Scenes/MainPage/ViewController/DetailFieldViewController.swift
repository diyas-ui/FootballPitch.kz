//
//  DetailFieldViewController.swift
//  FootballPitch.kz
//
//  Created by 123456 on 15.05.2022.
//

import UIKit

class DetailFieldViewController: UIViewController {
    public var field: FieldsModel? {
        didSet {
            self.headerView.images = field?.icons
            self.headerView.reloadPage()
            self.collectionView.reloadData()
        }
    }
    
    private var headerView = CarouselView()
    
    private var backButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .palette(.accent)
        button.clipsToBounds = true
        button.layer.cornerRadius = 12
        button.setImage(UIImage(named: "left_arrow"), for: .normal)
        button.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
        return button
    }()
    
    private var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 0
        flowLayout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .clear
        collectionView.alwaysBounceVertical = true
        collectionView.alwaysBounceHorizontal = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
                
        collectionView.registerCell(DataFieldCell.self)
        collectionView.registerCell(AmenitiesCell.self)
        collectionView.registerCell(LocationMapCell.self)
        
        return collectionView
    }()
    
    private var bookButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.palette(.accent)
        button.setTitle("Select date and time to book", for: .normal)
        button.setTitleColor(.palette(.white), for: .normal)
        button.titleLabel?.font = .semiboldPoppins(14)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(bookButtonClicked), for: .touchUpInside)
        return button
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
extension DetailFieldViewController {
    @objc func backButtonClicked() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func bookButtonClicked() {
        let vc = BookingViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - UICollectionView
extension DetailFieldViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueCell(DataFieldCell.self, indexPath: indexPath)
            cell.field = field
            return cell
        case 1:
            let cell = collectionView.dequeueCell(AmenitiesCell.self, indexPath: indexPath)
            cell.field = field
            return cell
        default:
            let cell = collectionView.dequeueCell(LocationMapCell.self, indexPath: indexPath)
            cell.field = field
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            if let description = field?.description {
                return CGSize(width: Constants.screenWidth, height: 98 + 18 + description.height(constraintedWidth: Constants.screenWidth - 32, font: .regularPoppins(14)))
            } else {
                return CGSize(width: Constants.screenWidth, height: 98)
            }
        case 1:
            return CGSize(width: Constants.screenWidth, height: 139)
        default:
            return CGSize(width: Constants.screenWidth, height: 170)
        }
    }
}

//MARK: - CodeDesignable
extension DetailFieldViewController: CodeDesignable {
    func setupViews() {
        view.backgroundColor = .palette(.lightGrey)
        
        [headerView, backButton, collectionView, bookButton].forEach {
            view.addSubview($0)
        }
        
        headerView.roundByCorners(corners: [.bottomRight, .bottomLeft], radius: 16.0)
        
        setupCollectionView()
        setupConstraints()
    }
    
    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func setupConstraints() {
        headerView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.right.left.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        backButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            $0.left.equalToSuperview().offset(8)
            $0.size.equalTo(24)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(8)
            $0.right.left.equalToSuperview()
        }
        
        bookButton.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom).offset(16)
            $0.right.left.equalToSuperview().inset(16)
            $0.height.equalTo(40)
            $0.bottom.equalTo(-16 - (self.tabBarController?.tabBar.frame.height ?? 0))
        }
    }
}
