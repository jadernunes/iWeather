//
//  FavoritesViewController.swift
//  iWeather
//
//  Created by Jader Nunes on 13/11/21.
//

import UIKit

final class FavoritesViewController: UIViewController {

    // MARK: - Attributes

    private let viewModel: FavoritesViewModelProtocol

    // MARK: - Elements

    private let searchButton = UIBarButtonItem(image: R.image.iconPlus(),
                                               style: .done,
                                               target: self,
                                               action: #selector(searchButtonPressed))

    // MARK: - Life cycle

    init(viewModel: FavoritesViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        createElements()
    }

    // MARK: - Custom methods

    private func setupUI() {
        view.backgroundColor = .clSecondary
        configureNavigationBar()
        populateStaticInfo()
    }

    private func populateStaticInfo() {
        title = viewModel.title
    }

    // MARK: - Actions

    @objc private func searchButtonPressed() {
        viewModel.openSearch()
    }
}

// MARK: - Create elements

extension FavoritesViewController {

    private func createElements() {
        createSearchButton()
    }

    private func createSearchButton() {
        navigationItem.rightBarButtonItems = [searchButton]
    }
}
