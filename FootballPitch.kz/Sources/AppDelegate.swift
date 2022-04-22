//
//  AppDelegate.swift
//  FootballPitch.kz
//
//  Created by Akzhol Imangazin on 6/22/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = OnboardingViewController()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        
        setupNavigationBar()
                
        return true
    }
    
    func setupNavigationBar() {
        UINavigationBar.appearance().backgroundColor = .palette(.accent)
        UINavigationBar.appearance().shadowImage = UIImage()
        
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font : UIFont.regularPoppins(18), NSAttributedString.Key.foregroundColor : UIColor.palette(.white)]
        
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().tintColor = .palette(.white)
    
        UINavigationBar.appearance().backIndicatorImage = UIImage(named: "left_arrow")
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(named: "left_arrow")
    }
}
