//
//  FavoriteProtocol.swift
//  iWeather
//
//  Created by Jader Nunes on 14/11/21.
//

import Foundation

protocol FavoriteProtocol {
    func add(model: WeatherSearch)
    func remove(id: Int64)
    func loadAll() -> [WeatherSearch]
}
