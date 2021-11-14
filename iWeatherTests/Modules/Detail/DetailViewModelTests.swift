//
//  DetailViewModelTests.swift
//  iWeatherTests
//
//  Created by Jader Nunes on 14/11/21.
//

import XCTest
@testable import iWeather

final class DetailViewModelTests: XCTestCase {

    func testDetailViewModel() {
        let model = Weather(woeid: 123,
                            title: "aa",
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

        let viewModel = DetailViewModel(woeid: 12, service: service)

        XCTAssertEqual(viewModel.state.value, .idle)
        viewModel.loadData()

        XCTAssertEqual(viewModel.state.value, .content(viewModel: InfoWeatherViewModel(weather: model)))
        XCTAssertEqual(viewModel.title, R.string.localizable.detailTitle())
    }
}
