//
//  EnumsTests.swift
//  iWeatherTests
//
//  Created by Jader Nunes on 14/11/21.
//

import XCTest
@testable import iWeather

final class EnumsTests: XCTestCase {

    func testEnumInitialFlow() {
        let allCases = InitialFlow.allCases
        let enumeratedCases: [InitialFlow] = [.favorites, .splash]

        XCTAssertEqual(InitialFlow.allCases.count, 2)
        let fistCase = enumeratedCases.first
        XCTAssertEqual(fistCase, .favorites)

        allCases.forEach {
            XCTAssertEqual(enumeratedCases.contains($0), true)
        }
    }

    func testEnumHTTPMethodType() {
        let allCases = HTTPMethodType.allCases
        let enumeratedCases: [HTTPMethodType] = [.delete, .get, .patch, .post]

        XCTAssertEqual(HTTPMethodType.allCases.count, 4)
        let fistCase = enumeratedCases.first
        XCTAssertEqual(fistCase, .delete)

        allCases.forEach {
            XCTAssertEqual(enumeratedCases.contains($0), true)
        }
    }
}
