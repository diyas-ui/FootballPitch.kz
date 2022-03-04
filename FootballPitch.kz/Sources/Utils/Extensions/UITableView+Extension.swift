//
//  UITableView+Extension.swift
//  FootballPitch.kz
//
//  Created by Akzhol Imangazin on 6/24/21.
//

import UIKit

extension UITableView {
    func registerCell<T: UITableViewCell>(_ cellClass: T.Type) {
        let cellId = String(describing: cellClass.self)
        register(cellClass.self, forCellReuseIdentifier: cellId)
    }
    
    func dequeueCell<T>(_ cellClass: T.Type, indexPath path: IndexPath) -> T {
        let cellId = String(describing: T.self)
        return self.dequeueReusableCell(withIdentifier: cellId, for: path) as! T
    }
    
    func registerHeaderFooter<T: UITableViewHeaderFooterView>(_ headerClass: T.Type) {
        let cellId = String(describing: T.self)
        register(headerClass.self, forCellReuseIdentifier: cellId)
    }
}
