//
//  MainVC.swift
//  FootballPitch.kz
//
//  Created by Akzhol Imangazin on 7/4/21.
//

import UIKit

class MainVC: UIViewController {
    
    private var fields: [FieldsModel] = [
        FieldsModel(icon: UIImage(named: "field1"), title: "Central Futsal", rating: 5.0, isFavorite: false, distance: 450, address: "Rozybakiyeva 57"),
        FieldsModel(icon: UIImage(named: "field2"), title: "Central Futsal", rating: 5.0, isFavorite: false, distance: 450, address: "Rozybakiyeva 57"),
        FieldsModel(icon: UIImage(named: "field1"), title: "Central Futsal", rating: 5.0, isFavorite: false, distance: 450, address: "Rozybakiyeva 57"),
        FieldsModel(icon: UIImage(named: "field2"), title: "Central Futsal", rating: 5.0, isFavorite: false, distance: 450, address: "Rozybakiyeva 57")
    ]
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .semiboldPoppins(24)
        label.textColor = .palette(.white)
        label.text = "All Futsals"
        return label
    }()
    
    private var topView = UIView()
    private var searchTextField = SearchTextField()
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        
        tableView.isScrollEnabled = false
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false

        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
}

//MARK: - Actions
extension MainVC {
    @objc func bellClicked() {
        print(#function)
    }
    
    @objc func didChangeText() {
        print(#function)
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fields.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(MainPageCell.self, indexPath: indexPath)
        cell.configureCell(object: fields[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}

//MARK: - CodeDesignable
extension MainVC: CodeDesignable {
    func setupViews() {
        view.backgroundColor = .palette(.lightGrey)
        
        [topView, searchTextField, tableView].forEach {
            view.addSubview($0)
        }
        topView.addSubview(searchTextField)
        
        setupNavigationBar()
        setupTopView()
        setupSearchView()
        setupTableView()
        setupConstraints()
    }
    
    func setupNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "bell"), style: .plain, target: nil, action: #selector(bellClicked))
    }
    
    func setupTopView() {
        topView.backgroundColor = .palette(.accent)
        topView.roundByCorners(corners: [.bottomRight, .bottomLeft], radius: 16.0)
    }
    
    func setupSearchView() {
        searchTextField.placeHolderAttributed = NSAttributedString(string: "Search for futsals", attributes: [NSAttributedString.Key.foregroundColor: UIColor.palette(.black800)])
        searchTextField.backgroundColor = .palette(.white)
        searchTextField.addTarget(self, action: #selector(didChangeText), for: .editingChanged)
        searchTextField.leftViewPadding = 12
        searchTextField.rightViewPadding = 6
        searchTextField.addLeftImage(image: UIImage(named: "search"), size: 16, tintColor: .palette(.black800))
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.registerCell(MainPageCell.self)
    }
    
    func setupConstraints() {
        topView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.right.left.equalToSuperview()
            $0.height.equalTo(156)
        }
        
        searchTextField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            $0.right.left.equalToSuperview().inset(16)
            $0.height.equalTo(40)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(searchTextField.snp.bottom).offset(8)
            $0.right.left.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
