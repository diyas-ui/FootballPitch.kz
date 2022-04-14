//
//  SkillLevelEnum.swift
//  FootballPitch.kz
//
//  Created by 123456 on 15.04.2022.
//

import Foundation

enum SkillLevelEnum: String {
    case beginner = "0"
    case intermediate = "1"
    case upper_intermediate = "2"
    case advanced = "3"
}

extension SkillLevelEnum {
    var title: String {
        switch self {
        case .beginner:
            return "Beginner"
        case .intermediate:
            return "Intermediate"
        case .upper_intermediate:
            return "Upper Intermediate"
        case .advanced:
            return "Advanced"
        }
    }
}
