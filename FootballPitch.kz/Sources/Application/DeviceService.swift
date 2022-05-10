//
//  DeviceService.swift
//  FootballPitch.kz
//
//  Created by 123456 on 11.05.2022.
//

import Foundation

class DeviceService {
    
    static let shared = DeviceService()
    
    private let defaults = UserDefaults.standard
    private let key = Constants.isFirstLaunch
    
    public var isFirstLaunch: Bool {
        get {
            return getFirstLaunch()
        }
        
        set {
            setFirstLaunch(newValue)
        }
    }
    
    private func getFirstLaunch() -> Bool {
        if let isFirstLaunch = defaults.value(forKey: key) as? Bool {
            return isFirstLaunch
        }
        
        return true
    }
    
    private func setFirstLaunch(_ isFirstLaunch: Bool) {
        defaults.setValue(isFirstLaunch, forKey: key)
    }
}
