//
//  AFMock.swift
//  iWeatherTests
//
//  Created by Jader Nunes on 14/11/21.
//

import Alamofire
@testable import iWeather

final class AFMock<T: Decodable>: NetworkManagerProtocol {

    // MARK: - Attributes

    private let data: T?

    // MARK: - Life cycle

    init(data: T) {
        self.data = data
    }

    // MARK: - Custom methods

    func makeRequest<T: Decodable>(requester: Requestable,
                                   _ completion: @escaping CompletionRequest<T>) {
        guard
            let data = data as? T
        else {
            completion(.failure(error: .generic()))
            return
        }
        completion(.success(data))
    }
}
