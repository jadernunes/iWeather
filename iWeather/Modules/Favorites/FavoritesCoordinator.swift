//
//  FavoritesCoordinator.swift
//  iWeather
//
//  Created by Jader Nunes on 13/11/21.
//

import UIKit

protocol FavoritesCoordinatorProtocol: Coordinator {
    func openSearch()
    func openDetail()
}

final class FavoritesCoordinator: FavoritesCoordinatorProtocol {

    // MARK: - Attributes

    private weak var presenter: UINavigationController?

    // MARK: - Life cycle

    init(presenter: UINavigationController) {
        self.presenter = presenter
    }

    // MARK: - Custom methods

    func start() {
        let viewModel = FavoritesViewModel(coordinator: self)
        let viewController = FavoritesViewController(viewModel: viewModel)
        presenter?.viewControllers = [viewController]
    }

    func openSearch() {
        guard let navigation = presenter else { return }
        let coordinator = SearchCoordinator(presenter: navigation)
        coordinator.start()
    }

    func openDetail() {
        //TODO: handle
    }
}
