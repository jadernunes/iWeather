//
//  Formater.swift
//  iWeather
//
//  Created by Jader Nunes on 14/11/21.
//

import Foundation

/// - Parameter locale: It's an optional. Default value is: autoupdatingCurrent.
final class Formater {

    // MARK: - Attributes

    private var localeDefault: Locale

    // MARK: - Life cycle

    /// Used to set a default formatter in a whole application. Default value is: autoupdatingCurrent.
    /// - Parameter locale: It's an optional.
    init(locale: Locale = Locale.autoupdatingCurrent) {
        localeDefault = locale
    }

    // MARK: - Custom methods
    
    func round(digits: Int = 0) -> NumberFormatter {
        let numberFormatter: NumberFormatter = .baseFormatter
        numberFormatter.locale = localeDefault
        numberFormatter.minimumFractionDigits = digits
        numberFormatter.maximumFractionDigits = digits
        return numberFormatter
    }
}
