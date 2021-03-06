//
//  PlayersViewController.swift
//  FootballPitch.kz
//
//  Created by 123456 on 12.05.2022.
//

import UIKit

class PlayersViewController: UIViewController {
    
    let viewModel = PlayersViewModel()
    
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
        
        tableView.isScrollEnabled = true
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false

        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        getAllPlayers()
    }
}

//MARK: - Methods
extension PlayersViewController {
    func getAllPlayers() {
        viewModel.getAllPlayers { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    @objc func didChangeText() {
        if let text = searchTextField.text {
            if text == "" {
                viewModel.players = viewModel.allPlayers
            } else {
                viewModel.players = viewModel.allPlayers.filter({ player in
                    if let name = player.name {
                        return name.contains(text)
                    }
                    
                    return false
                })
            }
            
            self.tableView.reloadData()
        }
    }
    
    func openDetailPlayers(index: Int) {
        let vc = DetailPlayersViewController()
        vc.player = viewModel.players[index]
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension PlayersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(PlayersCell.self, indexPath: indexPath)
        cell.configureCell(object: viewModel.players[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openDetailPlayers(index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
}

//MARK: - CodeDesignable
extension PlayersViewController: CodeDesignable {
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
            $0.bottom.equalTo(-8 - (self.tabBarController?.tabBar.frame.height ?? 0))
        }
    }
}
