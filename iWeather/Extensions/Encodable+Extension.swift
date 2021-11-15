//
//  Encodable+Extension.swift
//  iWeather
//
//  Created by Jader Nunes on 13/11/21.
//

import Foundation

extension Encodable {

    func toJson() -> [String: Any] {
        do {
            let jsonData = try JSONEncoder().encode(self)
            let json = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}
