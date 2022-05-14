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
       
        let mainVC = MainVC()
        mainVC.title = ""
        mainVC.tabBarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "tabBar_fields_icon").withRenderingMode(.alwaysTemplate), tag: 0)
        let mainNC = UINavigationController(rootViewController: mainVC)
    
        let playersVC = PlayersViewController()
        playersVC.title = ""
        playersVC.tabBarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "tabBar_players_icon").withRenderingMode(.alwaysTemplate), tag: 1)
        let playersNC = UINavigationController(rootViewController: playersVC)

        let mapVC = SecondVC()
        mapVC.title = "Map"
        mapVC.tabBarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "tabBar_location_icon").withRenderingMode(.alwaysTemplate), tag: 2)
        let mapNC = UINavigationController(rootViewController: mapVC)

        let profileVC = ProfileViewController()
        profileVC.title = ""
        profileVC.tabBarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "tabBar_profile_icon").withRenderingMode(.alwaysTemplate), tag: 3)
        let profileNC = UINavigationController(rootViewController: profileVC)

        tabBar.tintColor = .palette(.accent)
        tabBar.backgroundColor = .palette(.white)
        
        tabBar.itemPositioning = .fill
        
        let controllers = [mainNC, playersNC, mapNC, profileNC]
        viewControllers = controllers
    }

}
