//
//  SearchViewController.swift
//  iWeather
//
//  Created by Jader Nunes on 13/11/21.
//

import UIKit

final class SearchViewController: UIViewController {

    // MARK: - Attributes

    private let viewModel: SearchViewModelProtocol

    // MARK: - Elements

    private let content = SearchContent()

    // MARK: - Life cycle

    init(viewModel: SearchViewModelProtocol) {
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
}

// MARK: - Binds

extension SearchViewController {

    private func bindState() {
        viewModel.state.bindAndFire { [weak self] state in
            self?.content.render(with: state)
        }
    }
}
