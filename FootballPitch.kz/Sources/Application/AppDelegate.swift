//
//  AppDelegate.swift
//  FootballPitch.kz
//
//  Created by Akzhol Imangazin on 6/22/21.
//

import UIKit
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = OnboardingViewController()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        
        configureFirebase()
        AppAppearance.setupAppearance()
                
        return true
    }
    
    func configureFirebase() {
        FirebaseApp.configure()
    }
}
