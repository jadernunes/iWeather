//
//  SearchServicesError.swift
//  iWeatherTests
//
//  Created by Jader Nunes on 14/11/21.
//

import Alamofire
@testable import iWeather

final class SearchServicesError: SearchServicesProtocol {

    // MARK: - Requests

    func request(lat: Double, long: Double, _ completion: @escaping CompletionSearch) {
        completion(.failure(error: ErrorRequest.custom(message: "error.test"), statusCode: .unauthorized))
    }
}
