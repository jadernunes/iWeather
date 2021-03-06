//
//  DetailViewController.swift
//  iWeather
//
//  Created by Jader Nunes on 14/11/21.
//

import UIKit

final class DetailViewController: UIViewController {

    // MARK: - Attributes

    private let viewModel: DetailViewModelProtocol

    // MARK: - Elements

    private let content = DetailContent()

    // MARK: - Life cycle

    init(viewModel: DetailViewModelProtocol) {
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

extension DetailViewController {

    private func bindState() {
        viewModel.state.bindAndFire { [weak self] state in
            self?.content.render(with: state)
        }
    }
}
