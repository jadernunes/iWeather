//
//  DatabaseManager.swift
//  iWeather
//
//  Created by Jader Nunes on 14/11/21.
//

import Foundation

final class DatabaseManager: DatabaseProtocol {

    // MARK: - Attributes

    private let database: UserDefaults

    // MARK: - Life cycle

    init(database: UserDefaults = .standard) {
        self.database = database
    }

    // MARK: - Custom methods

    @discardableResult func save<T: ObjectRepresentable>(model: T) throws -> T {
        let object = try JSONEncoder.encoder.encode(model)
        database.setValue(object, forKey: T.key)
        return model
    }

    @discardableResult func save<T: ObjectRepresentable>(model: [T]) throws -> [T] {
        let object = try JSONEncoder.encoder.encode(model)
        database.setValue(object, forKey: T.key)
        return model
    }

    func loadObject<T: ObjectRepresentable>(type: T.Type) throws -> T? {
        guard let object = database.data(forKey: type.key) else { return nil }
        return try JSONDecoder.decoder.decode(T.self, from: object)
    }

    func loadAll<T: ObjectRepresentable>(type: T.Type) throws -> [T] {
        guard let object = database.data(forKey: type.key) else { return [] }
        return try JSONDecoder.decoder.decode([T].self, from: object)
    }
}
