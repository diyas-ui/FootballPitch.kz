//
//  SecondViewModel.swift
//  FootballPitch.kz
//
//  Created by Akzhol Imangazin on 6/28/21.
//

import RxSwift
import RxCocoa

struct ErrorModel: Error, Codable {
    var message: String?
    var errorCode: Int?
}

class SecondViewModel {
    
    private let bag = DisposeBag()
}
