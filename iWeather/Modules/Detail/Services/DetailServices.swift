//
//  DetailServices.swift
//  iWeather
//
//  Created by Jader Nunes on 14/11/21.
//

import Alamofire

typealias CompletionDetail = ((Response<Weather>) -> Void)

protocol DetailServicesProtocol: AnyObject {
    func request(woeid: Int64, _ completion: @escaping CompletionDetail)
}

final class DetailServices: DetailServicesProtocol {

    // MARK: - Attributes

    private let networkManager: NetworkManagerProtocol

    // MARK: - Life cycle

    init(networkManager: NetworkManagerProtocol = AF) {
        self.networkManager = networkManager
    }

    // MARK: - Requests

    func request(woeid: Int64, _ completion: @escaping CompletionDetail) {
        let request = DetailResources.request(woeid: woeid)
        networkManager.makeRequest(requester: request, completion)
    }
}
