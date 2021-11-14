//
//  ListWeatherComponent.swift
//  iWeather
//
//  Created by Jader Nunes on 13/11/21.
//

import UIKit

final class ListWeatherComponent: UIView {

    // MARK: - Attributes

    private weak var viewModel: ListWeatherViewModelProtocol?

    // MARK: - Elements

    private let tableView: UITableView = initElement {
        $0.rowHeight = UITableView.automaticDimension
        $0.estimatedRowHeight = 100
        $0.backgroundColor = .clSecondary
        $0.separatorStyle = .none
        $0.registerClass(cellType: WeatherCell.self)
    }

    // MARK: - Life cycle

    init() {
        super.init(frame: .zero)

        defineSubviews()
        defineSubviewsConstraints()
        setupProtocols()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Custom methods

    private func setupProtocols() {
        tableView.dataSource = self
        tableView.delegate = self
    }

    private func defineSubviews() {
        backgroundColor = .clSecondary
        addSubview(tableView)
    }

    private func reload() {
        tableView.reloadData()
    }
}

// MARK: - TableView dataSource

extension ListWeatherComponent: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.countItems ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let viewModelCell = viewModel?.viewModelCellAt(indexPath.row)
            else { return UITableViewCell() }

        let cell = tableView.dequeueReusableCell(with: WeatherCell.self, for: indexPath)
        cell.configure(with: viewModelCell)
        return cell
    }
}

// MARK: - TableView delegate

extension ListWeatherComponent: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.selectWeather(index: indexPath.row)
    }
}

// MARK: - Constraints

extension ListWeatherComponent {

    private func defineSubviewsConstraints() {
        tableView.anchor(self)
    }
}

// MARK: - Component

extension ListWeatherComponent: Component {

    enum ListWeatherState {
        case reload, content(viewModel: ListWeatherViewModelProtocol)
    }

    func render(with configuration: ListWeatherState) {
        switch configuration {
            case .content(let viewModel):
                self.viewModel = viewModel
                reload()
            case .reload:
                reload()
        }
    }
}
