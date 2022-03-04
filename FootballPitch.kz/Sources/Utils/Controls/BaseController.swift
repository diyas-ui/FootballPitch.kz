//
//  BaseController.swift
//  FootballPitch.kz
//
//  Created by Akzhol Imangazin on 7/4/21.
//

import UIKit
import RxSwift

class BaseController: UIViewController {

    let bag = DisposeBag()

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    deinit {
        print("💀: View Controller \(self) deinited")
    }

    @available(*, unavailable)
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) is not available")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.largeTitleDisplayMode = .never
        navigationItem.backButtonTitle = ""
        view.backgroundColor = .palette(.white)
        navigationController?.navigationBar.prefersLargeTitles = false        
    }
}
