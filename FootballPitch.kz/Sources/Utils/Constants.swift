//
//  Constants.swift
//  FootballPitch.kz
//
//  Created by Akzhol Imangazin on 6/28/21.
//

import UIKit

struct Constants {
    
    static let isFirstLaunch = "isFirstLaunch"
    static let authToken = "authToken"
    
    static let screenWidth = UIScreen.main.bounds.width
    static let screenHeight = UIScreen.main.bounds.height

    // The header fields
    enum HttpHeaderField: String {
        case authorization = "Authorization"
        case accept = "Accept"
        case acceptType = "Accept-Type"
        case contentType = "Content-Type"
        case acceptLanguage = "Accept-Language"
        case test = "test"
        case requester = "requester"
        case client = "client"
        case session = "session"
    }
    
    // The content type (JSON)
    enum ContentType: String {
        case json = "application/json"
        case imagePng = "image/png"
        case pdf = "application/pdf"
    }
    
    enum EntryType:String {
        case touchId = "touchId"
        case faceId = "faceId"
        case pin = "pin"
        case none = "none"
    }
}
