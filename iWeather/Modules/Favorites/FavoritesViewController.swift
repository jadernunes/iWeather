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

    private let content = FavoritesContent()

    // MARK: - Life cycle

    init(viewModel: FavoritesViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)

        content.viewModel = viewModel
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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        viewModel.loadData()
    }

    override func loadView() {
        view = content
    }

    // MARK: - Custom methods

    private func setupUI() {
        view.backgroundColor = .clSecondary
        configureNavigationBar()
        populateStaticInfo()
        bindUI()
    }

    private func bindUI() {
        bindState()
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
        let searchButton = UIBarButtonItem(image: R.image.iconSearch(),
                                           style: .done,
                                           target: self,
                                           action: #selector(searchButtonPressed))
        navigationItem.rightBarButtonItems = [searchButton]
    }
}

// MARK: - Binds

extension FavoritesViewController {

    private func bindState() {
        viewModel.state.bindAndFire { [weak self] state in
            DispatchQueue.main.async {
                self?.content.render(with: state)
            }
        }
    }
}
