//
//  UITableView+Extension.swift
//  iWeather
//
//  Created by Jader Nunes on 14/11/21.
//

import UIKit

extension UITableView {

    func registerClass<T: UITableViewCell>(cellType: T.Type) {
        register(cellType, forCellReuseIdentifier: cellType.className)
    }

    func dequeueReusableCell<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        guard
            let reusableCell = self.dequeueReusableCell(withIdentifier: type.className, for: indexPath) as? T
        else {
            //TODO: Send error to crashlytics
            return T(frame: .zero)
        }
        return reusableCell
    }
}
