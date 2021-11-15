//
//  Double+Extension.swift
//  iWeather
//
//  Created by Jader Nunes on 14/11/21.
//

import Foundation

extension Double {

    func formatted(locale: Locale = Locale.autoupdatingCurrent) -> String {
        let formatter = Formater(locale: locale).round()
        let value = Int(self)
        return formatter.string(from: NSNumber(value: value)) ?? ""
    }
}
