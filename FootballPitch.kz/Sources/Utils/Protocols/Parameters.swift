//
//  Parameters.swift
//  FootballPitch.kz
//
//  Created by Akzhol Imangazin on 7/4/21.
//

import Foundation

protocol Parameters: Encodable {
    func toData() -> Data?
}

extension Parameters where Self: Encodable {
    func toData() -> Data? {
        guard let data = try? JSONEncoder().encode(self) else {
            return nil
        }
        return data
    }
    
    func toDict() -> [String:Any] {
        guard let data = toData() else {
            return [:]
        }
        guard let dict = try? JSONSerialization.jsonObject(with: data, options: []) else {
            return [:]
        }
        return dict as? [String : Any] ?? [:]
    }
    
}
