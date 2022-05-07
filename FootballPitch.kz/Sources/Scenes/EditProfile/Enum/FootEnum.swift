//
//  FootEnum.swift
//  FootballPitch.kz
//
//  Created by 123456 on 15.04.2022.
//

import Foundation

enum FootEnum: String {
    case right = "0"
    case left = "1"
}

extension FootEnum {
    var title: String {
        switch self {
        case .right:
            return "Right foot"
        case .left:
            return "Left foot"
        }
    }
}
