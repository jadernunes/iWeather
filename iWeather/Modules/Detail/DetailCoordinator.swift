//
//  DetailCoordinator.swift
//  iWeather
//
//  Created by Jader Nunes on 14/11/21.
//

import UIKit

protocol DetailCoordinatorProtocol: Coordinator {}

final class DetailCoordinator: DetailCoordinatorProtocol {

    // MARK: - Attributes

    private weak var presenter: UINavigationController?

    // MARK: - Life cycle

    init(presenter: UINavigationController) {
        self.presenter = presenter
    }

    // MARK: - Custom methods

    func start(woeid: Int) {
        let viewModel = DetailViewModel(coordinator: self, woeid: woeid)
        let viewController = DetailViewController(viewModel: viewModel)
        presenter?.pushViewController(viewController, animated: true)
    }

    func close() {
        presenter?.popToRootViewController(animated: true)
    }
}
