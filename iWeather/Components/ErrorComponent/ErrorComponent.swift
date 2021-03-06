//
//  ErrorComponent.swift
//  iWeather
//
//  Created by Jader Nunes on 13/11/21.
//

import UIKit

protocol ErrorComponentDelegate: AnyObject {
    func willRetry()
}

final class ErrorComponent: UIView {

    // MARK: - Attributes

    weak var delegate: ErrorComponentDelegate?

    // MARK: - Elements

    private let errorImage: UIImageView = initElement {
        $0.image = R.image.iconError()
        $0.contentMode = .scaleAspectFit
    }
    private let infoLabel: UILabel = initElement {
        $0.text = R.string.localizable.errorTitle()
        $0.textAlignment = .center
    }
    private let retryButton: UIButton = initElement {
        $0.setTitle(R.string.localizable.retryTitle(), for: .normal)
        $0.setTitleColor(.clSecondary, for: .normal)
        $0.backgroundColor = .clPrimary
        $0.layer.cornerRadius = 8
        $0.addTarget(self, action: #selector(retryButtonPressed), for: .touchUpInside)
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
        addSubview(errorImage)
        addSubview(infoLabel)
        addSubview(retryButton)
    }

    // MARK: - Actions

    @objc private func retryButtonPressed() {
        delegate?.willRetry()
    }
}

// MARK: - Constraints

extension ErrorComponent {

    private func defineSubviewsConstraints() {
        setupLableConstraints()
        setupImageConstraints()
        setupButtonConstraints()
    }

    private func setupLableConstraints() {
        NSLayoutConstraint.activate([
            infoLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            infoLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            infoLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    private func setupImageConstraints() {
        NSLayoutConstraint.activate([
            errorImage.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: 16),
            errorImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            errorImage.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            errorImage.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3),
            errorImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            errorImage.bottomAnchor.constraint(equalTo: infoLabel.topAnchor, constant: -4)
        ])
    }

    private func setupButtonConstraints() {
        NSLayoutConstraint.activate([
            retryButton.heightAnchor.constraint(equalToConstant: 44),
            retryButton.widthAnchor.constraint(equalTo: errorImage.widthAnchor, multiplier: 0.5),
            retryButton.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 24),
            retryButton.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
}
