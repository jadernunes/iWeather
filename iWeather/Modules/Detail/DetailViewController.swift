//
//  DetailViewController.swift
//  iWeather
//
//  Created by Jader Nunes on 14/11/21.
//

import UIKit
import Combine

final class DetailViewController: UIViewController {

    // MARK: - Attributes

    private let viewModel: DetailViewModelProtocol
    private var cancelableBag = Set<AnyCancellable>()

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
        bindUI()
    }

    private func bindUI() {
        bindTitle()
        bindState()
    }
}

// MARK: - Binds

extension DetailViewController {

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
