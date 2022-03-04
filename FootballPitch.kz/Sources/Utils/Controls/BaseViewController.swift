//
//  BaseViewController.swift
//  FootballPitch.kz
//
//  Created by Akzhol Imangazin on 6/24/21.
//

import UIKit
import SnapKit
import RxSwift

class BaseViewController: UIViewController {
    
    //MARK: - Public properties
    
    let bag = DisposeBag()
    
    //MARK: - UI
    
    fileprivate lazy var tableView: UITableView = {
        $0.delegate = self
        $0.dataSource = self
        
        $0.separatorStyle = .none
        $0.backgroundColor = .clear
        
        $0.registerCell(UITableViewCell.self)
        $0.insertSubview(refreshControl, at: 0)
        
        $0.showsVerticalScrollIndicator = false
        $0.showsHorizontalScrollIndicator = false
        
        return $0
    }(UITableView())
    
    fileprivate var refreshControl: UIRefreshControl = {
        $0.tintColor = UIColor.red
        $0.addTarget(self, action: #selector(makeRequest), for: .valueChanged)
        return $0
    }(UIRefreshControl())
    
    fileprivate lazy var indicator = UIActivityIndicatorView(style: .medium)
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        startAnimating()
        makeRequest()
    }
}

//MARK: - Requests
extension BaseViewController {
    @objc func makeRequest() {
    }
}

//MARK: - Methods
extension BaseViewController {
    func startAnimating() {
        indicator.startAnimating()
    }
    
    func stopLoading() {
        refreshControl.endRefreshing()
        indicator.stopAnimating()
    }
}

//MARK: - UITableView
extension BaseViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(UITableViewCell.self, indexPath: indexPath)
        return cell
    }
}

//MARK: - CodeDesignable
extension BaseViewController: CodeDesignable {
    func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        tableView.addSubview(indicator)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { (m) in
            m.edges.equalToSuperview()
        }
        
        indicator.snp.makeConstraints { (m) in
            m.center.equalToSuperview()
        }
    }
}
