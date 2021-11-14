//
//  SearchCoordinator.swift
//  iWeather
//
//  Created by Jader Nunes on 13/11/21.
//

import UIKit

protocol SearchCoordinatorProtocol: Coordinator {
    func openDetail(woeid: Int64)
}

final class SearchCoordinator: SearchCoordinatorProtocol {

    // MARK: - Attributes

    private weak var presenter: UINavigationController?

    // MARK: - Life cycle

    init(presenter: UINavigationController) {
        self.presenter = presenter
    }

    // MARK: - Custom methods

    func start() {
        let viewModel = SearchViewModel(coordinator: self)
        let viewController = SearchViewController(viewModel: viewModel)
        presenter?.pushViewController(viewController, animated: true)
    }

    func openDetail(woeid: Int64) {
        guard let navigation = presenter else { return }
        let coordinator = DetailCoordinator(presenter: navigation)
        coordinator.start(woeid: woeid)
    }

    func close() {
        presenter?.popViewController(animated: true)
    }
}
