//
//  GeneralTests.swift
//  iWeatherTests
//
//  Created by Jader Nunes on 14/11/21.
//

import XCTest
@testable import iWeather

final class GeneralTests: XCTestCase {

    override func setUp() {

        super.setUp()
        UserDefaultsMock.resetStandardUserDefaults()
    }

    func testSceneDelegateData() {
        let appDelegate = SceneDelegate(window: UIWindow())
        XCTAssertNotNil(appDelegate.window)
    }

    func testClassObject() {
        class Object: NSObject, Coordinator {}
        let ref = Object()
        XCTAssertEqual(ref.className, "Object")
    }

    func testFormattDouble() {
        let value: Double = 123.2
        let valueFormatted = value.formatted(locale: Locale(identifier: "tests"))
        XCTAssertEqual(valueFormatted, "123")
    }

    func testErrorRequest() {
        var error: ErrorRequest = .custom(message: "custom")
        XCTAssertEqual(error.message, "custom")

        error = .generic(message: "generic")
        XCTAssertEqual(error.message, "generic")

        error = .noInternet(message: "noInternet")
        XCTAssertEqual(error.message, "noInternet")
    }

    func testDecode() {
        let json = """
                    [{
                        "distance": 845594,
                        "title": "Buenos Aires",
                        "location_type": "City",
                        "woeid": 468739,
                        "latt_long": "-34.608521,-58.373539"
                    }]
                    """
        let data = json.data(using: .utf8) ?? Data()

        do {
            let result = try JSONDecoder.decoder.decode([WeatherSearch].self, from: data)
            XCTAssertGreaterThan(result.count, 0)
            XCTAssertEqual(result.first?.title, "Buenos Aires")
        } catch {
            XCTFail()
        }
    }

    func testAddFavoriteSuccess() {
        let favorite = FavoriteManager(database: DatabaseManager(database: UserDefaultsMock.standard))
        XCTAssertEqual(favorite.loadAll().count, 0)

        let model = WeatherSearch(distance: 845594, title: "title", woeid: 123)
        favorite.add(model: model)
        XCTAssertEqual(favorite.loadAll().count, 1)

        favorite.remove(id: 123)
        XCTAssertEqual(favorite.loadAll().count, 0)
    }
}
