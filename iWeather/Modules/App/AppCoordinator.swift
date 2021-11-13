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
      case .home:
        openHome()
    }
  }

  // MARK: - Navigations

  private func openSplashScreen() {
    //TODO: handle
  }

  private func openHome() {
    //TODO: handle
  }
}
