//
//  WeatherCell.swift
//  iWeather
//
//  Created by Jader Nunes on 14/11/21.
//

import UIKit

final class WeatherCell: UITableViewCell {

    // MARK: - Elements

    private var viewModel: WeatherCellViewModelProtocol?
    private let content: WeatherCellContent = initElement()

    // MARK: - Life cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupUI()
        defineSubviews()
        defineSubviewsConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: - Custom methods

    private func setupUI() {
        selectionStyle = .none
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        content.render(with: .prepareForReuse)
    }

    func configure(with viewModel: WeatherCellViewModelProtocol) {

        self.viewModel = viewModel
        content.render(with: .content(viewModel: viewModel))
    }

    private func defineSubviews() {
        contentView.addSubview(content)
    }
}

// MARK: - Constraints

extension WeatherCell {

    private func defineSubviewsConstraints() {
        NSLayoutConstraint.activate([
            content.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 4),
            content.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            content.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -4),
            content.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}
