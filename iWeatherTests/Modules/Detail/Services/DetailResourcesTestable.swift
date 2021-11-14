//
//  DetailResourcesTestable.swift
//  iWeatherTests
//
//  Created by Jader Nunes on 14/11/21.
//

@testable import iWeather

enum DetailResourcesTestable {
    case request(woeid: Int64)
}

extension DetailResourcesTestable: Requestable {

    var method: HTTPMethodType { .get }
    var path: String {
        switch self {
            case .request(let woeid):
                return "api/location/\(woeid)"
        }
    }
}
