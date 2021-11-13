//
//  JSONDecoder+Extension.swift
//  iWeather
//
//  Created by Jader Nunes on 13/11/21.
//

import Foundation

extension JSONDecoder {

    static let decoder: JSONDecoder = {
        $0.dateDecodingStrategy = .formatted(.dateFormatterReveiced)
        return $0
    }(JSONDecoder())
}
