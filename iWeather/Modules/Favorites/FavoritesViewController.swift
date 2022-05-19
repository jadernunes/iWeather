//
//  FavoritesViewController.swift
//  iWeather
//
//  Created by Jader Nunes on 13/11/21.
//

import UIKit
import Combine

final class FavoritesViewController: UIViewController {

    // MARK: - Attributes

    private let viewModel: FavoritesViewModelProtocol
    private var cancelableBag = Set<AnyCancellable>()

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
        bindUI()
    }

    private func bindUI() {
        bindTitle()
        bindState()
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

    private func bindTitle() {
        viewModel.title
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in self?.title = $0 }
            .store(in: &cancelableBag)
    }

    private func bindState() {
        viewModel.state
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in self?.content.render(with: $0) }
            .store(in: &cancelableBag)
    }
}
