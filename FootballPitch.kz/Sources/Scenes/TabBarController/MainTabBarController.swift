//
//  MainTabBarController.swift
//  FootballPitch.kz
//
//  Created by Akzhol Imangazin on 6/24/21.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
                
        edgesForExtendedLayout = []
        extendedLayoutIncludesOpaqueBars = true
        view.backgroundColor = UIColor.white
        self.selectedIndex = 0
        
        self.delegate = self
                
        configUI()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        print("MainTabBarController deinit")
    }
}

//MARK: - Actions
extension MainTabBarController {
    
}


//MARK: - Delegate
extension MainTabBarController : UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
       
    }
}

//MARK: - ConfigUI
extension MainTabBarController {
    
    func configUI() {
       
        let mainVC = SecondVC()
        mainVC.title = "Main"
        mainVC.tabBarItem = UITabBarItem(title: "Main", image: #imageLiteral(resourceName: "gallery").withRenderingMode(.alwaysTemplate), tag: 0)
        let mainNC = UINavigationController(rootViewController: mainVC)
    
        let productVC = SecondVC()
        productVC.tabBarItem = UITabBarItem(title: "Pitch", image: #imageLiteral(resourceName: "gallery").withRenderingMode(.alwaysTemplate), tag: 1)
        productVC.title = "Pitch"
        let productNC = UINavigationController(rootViewController: productVC)

        let basketVC = SecondVC()
        basketVC.tabBarItem = UITabBarItem(title: "Profile", image: #imageLiteral(resourceName: "gallery").withRenderingMode(.alwaysTemplate), tag: 2)
        basketVC.title = "Profile"
        let basketNC = UINavigationController(rootViewController: basketVC)

        let menuVC = SecondVC()
        menuVC.title = "Menu"
        menuVC.tabBarItem = UITabBarItem(title: "Menu", image: #imageLiteral(resourceName: "gallery").withRenderingMode(.alwaysTemplate), tag: 3)
        let menuNC = UINavigationController(rootViewController: menuVC)

        tabBar.tintColor = UIColor.lightGray
        tabBar.backgroundColor = UIColor.white
        
        tabBar.itemPositioning = .fill
        
        let controllers = [mainNC, productNC, basketNC, menuNC]
        viewControllers = controllers
    }

}
