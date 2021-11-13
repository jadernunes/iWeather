//
//  FavoritesCoordinator.swift
//  iWeather
//
//  Created by Jader Nunes on 13/11/21.
//

import UIKit

protocol FavoritesCoordinatorProtocol: Coordinator {
    func openSearch()
}

final class FavoritesCoordinator: FavoritesCoordinatorProtocol {

    // MARK: - Attributes

    private weak var presenter: UIWindow?

    // MARK: - Life cycle

    init(presenter: UIWindow) {
        self.presenter = presenter
    }

    // MARK: - Custom methods

    func start() {
        let viewModel = FavoritesViewModel(coordinator: self)
        let viewController = FavoritesViewController(viewModel: viewModel)
        let navigation = UINavigationController(rootViewController: viewController)
        presenter?.rootViewController = navigation
        presenter?.makeKeyAndVisible()
    }

    func openSearch() {
        //TODO: Handle
    }
}
