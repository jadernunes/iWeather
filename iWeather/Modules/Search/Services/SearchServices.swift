//
//  SearchServices.swift
//  iWeather
//
//  Created by Jader Nunes on 13/11/21.
//

import Alamofire

typealias CompletionSearch = ((Response<[WeatherSearch]>) -> Void)

protocol SearchServicesProtocol: AnyObject {
    func request(lat: Double, long: Double, _ completion: @escaping CompletionSearch)
}

final class SearchServices: SearchServicesProtocol {

    // MARK: - Attributes

    private let networkManager: NetworkManagerProtocol

    // MARK: - Life cycle

    init(networkManager: NetworkManagerProtocol = AF) {
        self.networkManager = networkManager
    }

    // MARK: - Requests

    func request(lat: Double, long: Double, _ completion: @escaping CompletionSearch) {
        let request = SearchResources.request(lat: lat, long: long)
        networkManager.makeRequest(requester: request, completion)
    }
}
