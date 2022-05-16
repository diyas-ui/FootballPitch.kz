//
//  FieldsModel.swift
//  FootballPitch.kz
//
//  Created by 123456 on 08.04.2022.
//

import Foundation
import UIKit

enum Amenities {
    case wifi
    case shower
    case cafeteria
    case parking
}

struct FieldsModel {
    var icon: UIImage?
    var icons: [UIImage?] = []
    var title: String?
    var rating: Double?
    var isFavorite: Bool?
    var distance: Double?
    var address: String?
    var phone: String?
    var status: String?
    var description: String?
    var amenities: [Amenities] = []
    var workingFrom: String?
    var workingTo: String?
    var latitude: Double?
    var longitude: Double?
}
