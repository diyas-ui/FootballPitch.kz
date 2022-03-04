//
//  Dictionary+Extension.swift
//  FootballPitch.kz
//
//  Created by Akzhol Imangazin on 7/4/21.
//

import Foundation

extension Dictionary {
    func merged(with another: [Key: Value]) -> [Key: Value] {
        var result = self
        for entry in another {
            result[entry.key] = entry.value
        }
        return result
    }
}

extension Dictionary where Key: ExpressibleByStringLiteral, Value:Any {
    func toData() -> Data? {
        guard let data = try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted) else {
            return nil
        }
        return data
    }
}
