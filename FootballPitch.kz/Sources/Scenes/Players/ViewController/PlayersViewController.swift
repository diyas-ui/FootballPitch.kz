//
//  PlayersViewController.swift
//  FootballPitch.kz
//
//  Created by 123456 on 12.05.2022.
//

import UIKit

class PlayersViewController: UIViewController {
    
    private var allPlayers: [PlayersModel] = []
    private var players: [PlayersModel] = [
        PlayersModel(icon: UIImage(named: "icon_image"), name: "Azamat Sharapat", positions: ["Left defender", "Center back"]),
        PlayersModel(icon: UIImage(named: "icon_image"), name: "Agmanov Diyas", positions: ["Right defender", "Midfielder"]),
        PlayersModel(icon: UIImage(named: "icon_image"), name: "Kupesov Madi", positions: ["Left Winger", "Striker"]),
        PlayersModel(icon: UIImage(named: "icon_image"), name: "Sagyngali Adylet", positions: ["Left defender"]),
        PlayersModel(icon: UIImage(named: "icon_image"), name: "Imangazin Akzhol", positions: ["Midfielder"]),
        PlayersModel(icon: UIImage(named: "icon_image"), name: "Khametov Dauren", positions: ["Left winger", "Striker", "Midfielder"])
    ]
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .semiboldPoppins(24)
        label.textColor = .palette(.white)
        label.text = "Players"
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

//MARK: - Methods
extension PlayersViewController {
    @objc func didChangeText() {
        if let text = searchTextField.text {
            if text == "" {
                players = allPlayers
            } else {
                players = allPlayers.filter({ player in
                    if let name = player.name {
                        return name.contains(text)
                    }
                    
                    return false
                })
            }
            
            self.tableView.reloadData()
        }
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension PlayersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(PlayersCell.self, indexPath: indexPath)
        cell.configureCell(object: players[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
}

//MARK: - CodeDesignable
extension PlayersViewController: CodeDesignable {
    func setupViews() {
        view.backgroundColor = .palette(.lightGrey)
        allPlayers = players
        
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
    }
    
    func setupTopView() {
        topView.backgroundColor = .palette(.accent)
        topView.roundByCorners(corners: [.bottomRight, .bottomLeft], radius: 16.0)
    }
    
    func setupSearchView() {
        searchTextField.placeHolderAttributed = NSAttributedString(string: "Search for players", attributes: [NSAttributedString.Key.foregroundColor: UIColor.palette(.black800)])
        searchTextField.backgroundColor = .palette(.white)
        searchTextField.addTarget(self, action: #selector(didChangeText), for: .editingChanged)
        searchTextField.leftViewPadding = 12
        searchTextField.rightViewPadding = 6
        searchTextField.addLeftImage(image: UIImage(named: "search"), size: 16, tintColor: .palette(.black800))
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.registerCell(PlayersCell.self)
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
