//
//  Weather.swift
//  iWeather
//
//  Created by Jader Nunes on 14/11/21.
//

import Foundation

struct Weather: Codable {
    let woeid: Int64
    let title: String
    let weatherDays: [WeatherDay]

    enum CodingKeys: String, CodingKey {
        case title,
             woeid,
             weatherDays = "consolidated_weather"
    }
}
