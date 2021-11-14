//
//  Date+Extension.swift
//  iWeather
//
//  Created by Jader Nunes on 14/11/21.
//

import Foundation

extension Date {

    var day: Int {
        Calendar.baseCalendar.dateComponents([.day], from: self).day ?? 0
    }

    func toString(format: DateFormatType = .default) -> String {
        let formatter = DateFormatter.dateFormatterShow
        formatter.dateFormat = format.rawValue
        return formatter.string(from: self)
    }
}
