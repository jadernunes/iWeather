//
//  WeatherCellContent.swift
//  iWeather
//
//  Created by Jader Nunes on 14/11/21.
//

import UIKit

final class WeatherCellContent: UIView {

    // MARK: - Attributes

    private weak var viewModel: WeatherCellViewModelProtocol?

    // MARK: - Elements

    private let addButton: UIButton = initElement {
        $0.setImage(R.image.iconPlus(), for: .normal)
        $0.backgroundColor = .clSecondary
        $0.layer.cornerRadius = 12
        $0.clipsToBounds = false
        $0.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        $0.addShadow()
    }
    private let titleLabel: UILabel = initElement {
        $0.font = .subTitle
        $0.textColor = .clPrimary
    }

    // MARK: - Life cycle

    init() {
        super.init(frame: .zero)

        setupUI()
        defineSubviews()
        defineSubviewsConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: - Custom methods

    private func defineSubviews() {
        addSubview(titleLabel)
        addSubview(addButton)
    }

    private func setupUI() {
        backgroundColor = .clBeige
        layer.cornerRadius = 8
        addShadow()
    }

    // MARK: - Actions

    @objc private func addButtonPressed() {
        viewModel?.addWeather()
    }
}

// MARK: - Component

extension WeatherCellContent: Component {

    enum Configuration {
        case prepareForReuse, content(viewModel: WeatherCellViewModelProtocol)
    }

    func render(with configuration: Configuration) {

        switch configuration {
            case .content(let viewModel):
                self.viewModel = viewModel
                populdateUI()

            case .prepareForReuse:
                titleLabel.text = nil
        }
    }

    private func populdateUI() {
        titleLabel.text = viewModel?.title
    }
}

// MARK: - Constraints

extension WeatherCellContent {

    private func defineSubviewsConstraints() {
        setupAddButtonConstraints()
        setupTitleConstraints()
    }

    private func setupAddButtonConstraints() {
        NSLayoutConstraint.activate([
            addButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
            addButton.heightAnchor.constraint(equalToConstant: 24),
            addButton.widthAnchor.constraint(equalToConstant: 24),
            addButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    private func setupTitleConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            titleLabel.rightAnchor.constraint(greaterThanOrEqualTo: addButton.leftAnchor, constant: -8),
        ])
    }
}
