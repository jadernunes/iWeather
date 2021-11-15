//
//  ListWeatherTests.swift
//  iWeatherTests
//
//  Created by Jader Nunes on 14/11/21.
//

import XCTest
@testable import iWeather

final class ListWeatherTests: XCTestCase {

    func testListWeatherViewModel() {
        let model = WeatherSearch(distance: 845594, title: "title", woeid: 468739)
        let viewModel = ListWeatherViewModel(data: [model], actions: [.add])

        XCTAssertEqual(viewModel.countItems, 1)
        XCTAssertEqual(viewModel.canEdit, false)

        let spy = ListWeatherSpy()
        viewModel.delegate = spy

        XCTAssertEqual(spy.willAdd, false)
        viewModel.addButtonPressed(weather: model)
        XCTAssertEqual(spy.willAdd, true)

        XCTAssertEqual(spy.hasSeletected, false)
        viewModel.selectWeather(index: 0)
        XCTAssertEqual(spy.hasSeletected, true)

        XCTAssertEqual(spy.willRemove, false)
        viewModel.removeWeather(index: 0)
        XCTAssertEqual(spy.willRemove, true)
    }
}

private final class ListWeatherSpy: ListWeatherDelegate {

    var hasSeletected = false
    var willRemove = false
    var willAdd = false

    func didSelectWeather(_ weather: WeatherSearch?) {
        hasSeletected = true
    }

    func willAddWeather(_ weather: WeatherSearch?) {
        willAdd = true
    }

    func willRemoveWeather(_ weather: WeatherSearch?) {
        willRemove = true
    }
}
