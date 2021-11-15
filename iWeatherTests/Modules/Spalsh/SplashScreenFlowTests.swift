//
//  SplashScreenFlowTests.swift
//  iWeatherTests
//
//  Created by Jader Nunes on 14/11/21.
//

import XCTest
@testable import iWeather

final class SplashScreenFlowTests: XCTestCase {

    func testSplashScreenNavigations() {
        let window = UIWindow()
        let coordinator = SplashScreenCoordinator(presenter: window)
        coordinator.start()

        XCTAssertTrue(window.rootViewController is SplashScreenViewController)
    }

    func testSplashScreenCoordinatorFlow() {
        let window = UIWindow()
        let appCoordinator = AppCoordinator(window: window)
        let coordinator = SplashScreenCoordinator(presenter: window)
        coordinator.delegate = appCoordinator

        let viewModel = SplashScreenViewModel(coordinator: coordinator)
        viewModel.openMainApp()

        let navigation = window.rootViewController as? UINavigationController
        XCTAssertTrue(navigation?.visibleViewController is FavoritesViewController)
    }
}
