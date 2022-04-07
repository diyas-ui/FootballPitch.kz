//
//  Date+String+Extension.swift
//  FootballPitch.kz
//
//  Created by Akzhol Imangazin on 6/24/21.
//

import UIKit

enum DateFormat: String {
    case withoutTimeDush = "yyyy-MM-dd"
    case withTimeDush = "yyyy-MM-dd HH:mm:ss"
    case withoutTimeDot = "dd.MM.yyyy"
    case withTimeDot = "dd.MM.yyyy HH:mm"
    case withTimeSplashDot = "HH:mm / dd.MM.yyyy"
    case dd_month_yyyy = "dd MMMM yyyy"
    case month_yyyy = "LLLL yyyy"
    case MMMddTimeYYYY = "MMM dd HH:mm:ss yyyy"
    case bafFormat = "yyyyMMddHHmmss"
    case dMMMM = "d MMMM"
    case nameDay = "EEEE"
    case natioanlStandart = "YYYY-MM-dd\'T\'HH:mm:ssZ"
//    case dayWithTime = "E, HH:mm"
    case dayWithTime = "E\nHH:mm"
    case monthWithYear = "MM.yyyy"
    case shortMonthWithYear = "MMM\nyyyy"
}

extension Date {
    func string(format: DateFormat) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        let str = dateFormatter.string(from: self)
        return str
    }
}
