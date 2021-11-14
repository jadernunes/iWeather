//
//  UIColor+Extension.swift
//  iWeather
//
//  Created by Jader Nunes on 13/11/21.
//

import UIKit

extension UIColor {

    // MARK: - Custom colors

    static let clGray = gray
    static let clSecondary = white
    static let clSeparator = lightGray
    static let clNoData = lightGray.withAlphaComponent(0.3)
    static let clBlack = black

    /// HEX: #FF5229
    static let clPrimary = UIColor(named: "primary") ?? white

    /// HEX: #FFFAF5
    static let clBeige = UIColor(named: "beige") ?? white
}
