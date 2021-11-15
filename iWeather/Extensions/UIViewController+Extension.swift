//
//  UIViewController+Extension.swift
//  iWeather
//
//  Created by Jader Nunes on 13/11/21.
//

import UIKit

extension UIViewController {

    func configureNavigationBar(isHidden: Bool = false,
                                isTranslucent: Bool = false) {
        navigationController?.isNavigationBarHidden = isHidden
        navigationController?.navigationBar.barTintColor = .clPrimary
        navigationController?.navigationBar.isTranslucent = isTranslucent
        navigationController?.navigationBar.tintColor = isHidden ? .clear : .clSecondary
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.clSecondary,
            .font: UIFont.title
        ]
    }
}
