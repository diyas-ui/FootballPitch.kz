//
//  SecondVC.swift
//  FootballPitch.kz
//
//  Created by Akzhol Imangazin on 6/22/21.
//

import UIKit
import RxSwift
import RxCocoa

class SecondVC: UIViewController {
        
    private let viewModel = SecondViewModel()
    private let bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
}
