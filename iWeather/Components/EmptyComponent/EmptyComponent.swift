//
//  EmptyComponent.swift
//  iWeather
//
//  Created by Jader Nunes on 13/11/21.
//

import UIKit

final class EmptyComponent: UIView {

    // MARK: - Elements

    private let emptyImage: UIImageView = initElement {
        $0.image = R.image.iconNoData()
        $0.contentMode = .scaleAspectFit
    }
    private let infoLabel: UILabel = initElement {
        $0.text = R.string.localizable.noDataTitle()
        $0.textAlignment = .center
    }

    // MARK: - Life cycle

    init() {
        super.init(frame: .zero)

        defineSubviews()
        defineSubviewsConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Custom methods

    private func defineSubviews() {
        backgroundColor = .clSecondary
        addSubview(emptyImage)
        addSubview(infoLabel)
    }
}

// MARK: - Constraints

extension EmptyComponent {

    private func defineSubviewsConstraints() {
        setupImageConstraints()
        setupLableConstraints()
    }

    private func setupImageConstraints() {
        NSLayoutConstraint.activate([
            emptyImage.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: 16),
            emptyImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            emptyImage.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            emptyImage.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3),
            emptyImage.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -24)
        ])
    }

    private func setupLableConstraints() {
        NSLayoutConstraint.activate([
            infoLabel.heightAnchor.constraint(equalToConstant: 24),
            infoLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            infoLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            infoLabel.topAnchor.constraint(equalTo: emptyImage.bottomAnchor, constant: 4),
            infoLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -16)
        ])
    }
}
