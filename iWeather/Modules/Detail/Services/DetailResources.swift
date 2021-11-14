//
//  DetailResources.swift
//  iWeather
//
//  Created by Jader Nunes on 14/11/21.
//

import Alamofire

enum DetailResources {
    case request(woeid: Int64)
}

extension DetailResources: Requestable {

    var method: HTTPMethodType { .get }
    var path: String {
        switch self {
            case .request(let woeid):
                return "api/location/\(woeid)"
        }
    }
}
