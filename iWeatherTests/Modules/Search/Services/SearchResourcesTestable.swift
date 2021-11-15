//
//  SearchResourcesTestable.swift
//  iWeatherTests
//
//  Created by Jader Nunes on 14/11/21.
//

@testable import iWeather

enum SearchResourcesTestable {
    case request(lat: Double, long: Double)
}

extension SearchResourcesTestable: Requestable {

    var method: HTTPMethodType { .get }
    var parameters: RequestParameters? {
        switch self {
            case .request(let lat, let long):
                return ["lattlong": "\(lat),\(long)"]
        }
    }

    var path: String {
        "api/location/search/"
    }
}
