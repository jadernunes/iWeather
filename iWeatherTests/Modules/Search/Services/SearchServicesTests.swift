//
//  SearchServicesTests.swift
//  iWeatherTests
//
//  Created by Jader Nunes on 14/11/21.
//

import XCTest
@testable import iWeather

final class SearchServicesTests: XCTestCase {

    func testSearchSuccess() {
        let model = [WeatherSearch(distance: 845594, title: "title", woeid: 468739)]
        let mock = AFMock(data: model)
        let service = SearchServices(networkManager: mock)
        service.request(lat: 12, long: 34) { response in
            switch response {
                case .success(let data):
                    XCTAssertGreaterThan(data.count, 0)
                case .failure:
                    XCTFail()
            }
        }
    }

    func testSearchError() {
        let service = SearchServicesError()
        service.request(lat: 12, long: 34) { response in
            switch response {
                case .success:
                    XCTFail()
                case .failure(let error, let statusCode):
                    XCTAssertEqual(error.message, "error.test")
                    XCTAssertEqual(statusCode, .unauthorized)
            }
        }
    }

    func testSearchResources() {
        let resources = SearchResourcesTestable.request(lat: 23, long: 23)
        XCTAssertEqual(resources.method, .get)
        XCTAssertEqual(resources.path, "api/location/search/")
    }
}
