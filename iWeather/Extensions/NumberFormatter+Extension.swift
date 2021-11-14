//
//  NumberFormatter+Extension.swift
//  iWeather
//
//  Created by Jader Nunes on 14/11/21.
//

import Foundation

extension NumberFormatter {

    static let baseFormatter: NumberFormatter  = {
        $0.roundingMode = .down
        return $0
    }(NumberFormatter())
}
