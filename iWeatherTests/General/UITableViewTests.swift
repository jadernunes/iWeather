//
//  UITableViewTests.swift
//  iWeatherTests
//
//  Created by Jader Nunes on 14/11/21.
//

import XCTest
@testable import iWeather

final class UITableViewTests: XCTestCase {

    func testRegisterCells() {
        let table = UITableView()
        table.registerClass(cellType: WeatherCell.self)
        let cell = table.dequeueReusableCell(with: WeatherCell.self, for: IndexPath())
        XCTAssertNotNil(cell)
    }
}
