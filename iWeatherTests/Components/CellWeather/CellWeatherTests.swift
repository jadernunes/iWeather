//
//  CellWeatherTests.swift
//  iWeatherTests
//
//  Created by Jader Nunes on 14/11/21.
//

import XCTest
@testable import iWeather

final class CellWeatherTests: XCTestCase {

    func testWeatherCellViewModel() {
        let model = WeatherSearch(distance: 845594, title: "blabla", woeid: 468739)
        let viewModel = WeatherCellViewModel(weather: model, canAdd: true)

        XCTAssertEqual(viewModel.shouldShowAdd, true)
        XCTAssertEqual(viewModel.title, "blabla")

        let spy = CellWeatherSpy()
        viewModel.delegate = spy

        XCTAssertEqual(spy.willAdd, false)
        viewModel.addWeather()
        XCTAssertEqual(spy.willAdd, true)
    }
}

private final class CellWeatherSpy: WeatherCellContentDelegate {

    var willAdd = false

    func addButtonPressed(weather: WeatherSearch) {
        willAdd = true
    }
}
