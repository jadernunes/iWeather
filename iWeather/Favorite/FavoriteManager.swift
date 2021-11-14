//
//  FavoriteManager.swift
//  iWeather
//
//  Created by Jader Nunes on 14/11/21.
//

import Foundation

final class FavoriteManager: FavoriteProtocol {

    // MARK: - Attributes

    private let database: DatabaseProtocol

    // MARK: - Life cycle

    init(database: DatabaseProtocol = DatabaseManager()) {
        self.database = database
    }

    // MARK: - Custom methods

    func add(model: WeatherSearch) {
        do {
            var objects = try database.loadAll(type: WeatherSearch.self)
            if !objects.contains(where: { $0.woeid == model.woeid }) {
                objects.append(model)
                try database.save(model: objects)
            }
        } catch {
            //TODO: handle error
        }
    }

    func remove(id: Int64) {
        do {
            var objects = try database.loadAll(type: WeatherSearch.self)
            objects.removeAll(where: { $0.woeid == id })
            try database.save(model: objects)
        } catch {
            //TODO: handle error
        }
    }

    func loadAll() -> [WeatherSearch] {
        do {
            return try database.loadAll(type: WeatherSearch.self)
        } catch {
            return []
        }
    }
}
