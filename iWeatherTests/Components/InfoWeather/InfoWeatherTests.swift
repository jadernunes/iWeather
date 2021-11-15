//
//  InfoWeatherTests.swift
//  iWeatherTests
//
//  Created by Jader Nunes on 14/11/21.
//

import XCTest
@testable import iWeather

final class InfoWeatherTests: XCTestCase {

    func testInfoWeatherViewModelFlow() {
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

        let viewModel = InfoWeatherViewModel(weather: model)


        XCTAssertEqual(viewModel.cityName, "aa")
        XCTAssertEqual(viewModel.weatherTypeName, "Cloud")
        XCTAssertEqual(viewModel.weatherIconPath, Config.urlImage(imageName: "cl"))
        XCTAssertEqual(viewModel.minTemp, "L: 10º")
        XCTAssertEqual(viewModel.maxTemp, "H: 14º")
        XCTAssertEqual(viewModel.currentTemp, "13º")
    }
}
