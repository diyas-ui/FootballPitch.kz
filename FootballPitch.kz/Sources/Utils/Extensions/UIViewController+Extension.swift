//
//  UIViewController+Extension.swift
//  FootballPitch.kz
//
//  Created by Akzhol Imangazin on 6/24/21.
//

import UIKit

extension UIViewController {
    func hideNavBar(hide: Bool) {
        self.navigationController?.navigationBar.isHidden = hide
    }
    
    func hideTabBar(hide: Bool) {
        self.tabBarController?.tabBar.isHidden = hide
    }
}
