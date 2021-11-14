//
//  DetailServicesTests.swift
//  iWeatherTests
//
//  Created by Jader Nunes on 14/11/21.
//

import XCTest
@testable import iWeather

final class DetailServicesTests: XCTestCase {

    func testDetailError() {
        let service = DetailServicesError()
        service.request(woeid: 12) { response in
            switch response {
                case .success:
                    XCTFail()
                case .failure(let error, let statusCode):
                    XCTAssertEqual(error.message, "error.test")
                    XCTAssertEqual(statusCode, .unauthorized)
            }
        }
    }

    func testDetailSuccess() {
        let model = Weather(woeid: 455827,
                            title: "São Paulo",
                            weatherDays: [
                                WeatherDay(weatherStateName: "Cloud",
                                           weatherStateCode: "cl",
                                           minTemp: 10.3,
                                           maxTemp: 14.5,
                                           currentTemp: 13.0,
                                           date: Date())
                            ])
        let mock = AFMock(data: model)

        let service = DetailServices(networkManager: mock)
        service.request(woeid: 455827) { response in
            switch response {
                case .success(let data):
                    XCTAssertEqual(data.title, "São Paulo")
                    XCTAssertEqual(data.woeid, 455827)
                    XCTAssertEqual(data.weatherDays.count, 1)
                case .failure:
                    XCTFail()
            }
        }
    }

    func testDetailResources() {
        let resources = DetailResourcesTestable.request(woeid: 12)
        XCTAssertEqual(resources.method, .get)
        XCTAssertEqual(resources.path, "api/location/12")
    }
}
