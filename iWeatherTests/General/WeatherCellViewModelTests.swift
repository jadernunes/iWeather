//
//  WeatherCellViewModelTests.swift
//  iWeatherTests
//
//  Created by Jader Nunes on 14/11/21.
//

import XCTest
@testable import iWeather

final class WeatherCellViewModelTests: XCTestCase {

    func testWeatherCellSuccess() {
        let model = WeatherSearch(distance: 845594, title: "title", woeid: 468739)
        let cellSpy = WeatherCellSpy()
        let viewModel = WeatherCellViewModel(weather: model, canAdd: true)
        viewModel.delegate = cellSpy

        XCTAssertEqual(cellSpy.hasWeatherAdded, false)
        XCTAssertEqual(viewModel.shouldShowAdd, true)

        viewModel.addWeather()
        XCTAssertEqual(cellSpy.hasWeatherAdded, true)
    }
}

// MARK: - WeatherCell delegate

private final class WeatherCellSpy: WeatherCellContentDelegate {

    var hasWeatherAdded = false

    func addButtonPressed(weather: WeatherSearch) {
        hasWeatherAdded = true
    }
}
