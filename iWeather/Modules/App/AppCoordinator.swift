//
//  AppCoordinator.swift
//  iWeather
//
//  Created by Jader Nunes on 13/11/21.
//

import UIKit

final class AppCoordinator: Coordinator {

    // MARK: - Attributes

    private let window: UIWindow?
    private let initialFlow: InitialFlow

    // MARK: - Life cycle

    init(window: UIWindow?, initialFlow: InitialFlow = .splash) {
        self.window = window
        self.initialFlow = initialFlow
    }

    // MARK: - Attributes

    func start() {
        switch initialFlow {
            case .splash:
                openSplashScreen()
            case .favorites:
                openFavorites()
        }
    }

    // MARK: - Navigations

    private func openSplashScreen() {
        guard let window = window else { return }
        let coodinator = SplashScreenCoordinator(presenter: window)
        coodinator.delegate = self
        coodinator.start()
    }

    private func openFavorites() {
        guard let window = window else { return }
        let coodinator = FavoritesCoordinator(presenter: window)
        coodinator.start()
    }
}

// MARK: - SplashScreen delegate

extension AppCoordinator: SplashScreenCoordinatorDelegate {

    func didFinishSplashScreen() {
        openFavorites()
    }
}
