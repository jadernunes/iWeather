//
//  Config.swift
//  iWeather
//
//  Created by Jader Nunes on 13/11/21.
//

import UIKit

final class Config {

    // MARK: - Attributes

    static var baseURL: String {
        configKey(key: "urlbase")
    }

    // MARK: - Custom methods

    private static func configKey(key: String) -> String {
        guard
            let path = Bundle.main.path(forResource: "Config", ofType: "plist"),
            let dictionary = NSDictionary(contentsOfFile: path) as? [String: Any],
            let value = dictionary[key] as? String
        else { return "" }
        return value
    }

    static func urlImage(imageName: String) -> String {
        baseURL + "static/img/weather/png/64/\(imageName).png"
    }
}
