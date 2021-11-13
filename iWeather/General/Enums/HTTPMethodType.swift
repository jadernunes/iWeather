//
//  HTTPMethodType.swift
//  iWeather
//
//  Created by Jader Nunes on 13/11/21.
//

import Foundation

enum HTTPMethodType: String, CaseIterable {
    case get = "GET"
    case post = "POST"
    case patch = "PATCH"
    case delete = "DELETE"
}
