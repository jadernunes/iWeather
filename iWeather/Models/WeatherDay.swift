//
//  WeatherDay.swift
//  iWeather
//
//  Created by Jader Nunes on 14/11/21.
//

import Foundation

struct WeatherDay: Codable {
    let weatherStateName: String
    let weatherStateCode: String
    let minTemp: Double
    let maxTemp: Double
    var currentTemp: Double
    let date: Date

    enum CodingKeys: String, CodingKey {
        case
            weatherStateName = "weather_state_name",
            weatherStateCode = "weather_state_abbr",
            minTemp = "min_temp",
            maxTemp = "max_temp",
            currentTemp = "the_temp",
            date = "applicable_date"
    }
}
