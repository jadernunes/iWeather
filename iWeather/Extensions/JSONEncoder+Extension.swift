//
//  JSONEncoder+Extension.swift
//  iWeather
//
//  Created by Jader Nunes on 14/11/21.
//

import Foundation

extension JSONEncoder {

    static let encoder: JSONEncoder = {
        $0.dateEncodingStrategy = .formatted(.dateFormatterReveiced)
        return $0
    }(JSONEncoder())
}
