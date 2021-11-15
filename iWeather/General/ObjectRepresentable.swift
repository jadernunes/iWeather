//
//  ObjectRepresentable.swift
//  iWeather
//
//  Created by Jader Nunes on 14/11/21.
//

import Foundation

protocol ObjectRepresentable: Codable {
    static var key: String { get }
}
