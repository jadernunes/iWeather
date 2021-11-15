//
//  SearchResources.swift
//  iWeather
//
//  Created by Jader Nunes on 13/11/21.
//

import Alamofire

enum SearchResources {
    case request(lat: Double, long: Double)
}

extension SearchResources: Requestable {
    
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
