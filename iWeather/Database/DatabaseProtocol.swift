//
//  DatabaseProtocol.swift
//  iWeather
//
//  Created by Jader Nunes on 14/11/21.
//

import Foundation

protocol DatabaseProtocol {
    @discardableResult func save<T: ObjectRepresentable>(model: T) throws -> T
    @discardableResult func save<T: ObjectRepresentable>(model: [T]) throws -> [T]
    func loadObject<T: ObjectRepresentable>(type: T.Type) throws -> T?
    func loadAll<T: ObjectRepresentable>(type: T.Type) throws -> [T]
}
