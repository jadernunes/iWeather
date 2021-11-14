//
//  AppCoordinatorTests.swift
//  iWeatherTests
//
//  Created by Jader Nunes on 14/11/21.
//

import XCTest
@testable import iWeather

final class AppCoordinatorTests: XCTestCase {

    func testAppCoordinatorDefaultFlow() {
        let window = UIWindow()
        let coordinator = AppCoordinator(window: window)
        coordinator.start()
        XCTAssertTrue(window.rootViewController is SplashScreenViewController)
    }

    func testAppCoordinatorSearch() {
        let window = UIWindow()
        let coordinator = AppCoordinator(window: window, initialFlow: .favorites)
        coordinator.start()

        let navigation = window.rootViewController as? UINavigationController
        XCTAssertTrue(navigation?.visibleViewController is FavoritesViewController)
    }
}
