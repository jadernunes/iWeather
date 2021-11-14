//
//  DetailServicesError.swift
//  iWeatherTests
//
//  Created by Jader Nunes on 14/11/21.
//

import Alamofire
@testable import iWeather

final class DetailServicesError: DetailServicesProtocol {

    // MARK: - Requests

    func request(woeid: Int64, _ completion: @escaping CompletionDetail) {
        completion(.failure(error: ErrorRequest.custom(message: "error.test"), statusCode: .unauthorized))
    }
}
