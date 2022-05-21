//
//  AppDelegate.swift
//  FootballPitch.kz
//
//  Created by Akzhol Imangazin on 6/22/21.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import GoogleMaps

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        start(window)
        window?.makeKeyAndVisible()
                
        AppAppearance.setupAppearance()
        
        GMSServices.provideAPIKey("AIzaSyBulyUUByuFnCtu7l2xmBxM8w5_qdGDygo")
                
        return true
    }
    
    func start(_ window: UIWindow?) {
        configureFirebase()
        
//        if DeviceService.shared.isFirstLaunch {
//            window?.rootViewController = OnboardingViewController()
//            DeviceService.shared.isFirstLaunch = false
//        } else {
//            if FirebaseAuth.Auth.auth().currentUser != nil {
//                window?.rootViewController = MainTabBarController()
//            } else {
////                window?.rootViewController = LoginViewController(with: .login)
//                window?.rootViewController = MainTabBarController()
//            }
//        }
        window?.rootViewController = MainTabBarController()
    }
    
    func configureFirebase() {
        FirebaseApp.configure()
    }
}
