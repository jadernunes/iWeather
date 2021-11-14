//
//  WeatherSearch.swift
//  iWeather
//
//  Created by Jader Nunes on 13/11/21.
//

import Foundation

struct WeatherSearch: Codable {
    let distance: Int64
    let title: String
    let woeid: Int64
}
