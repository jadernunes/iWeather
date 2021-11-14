//
//  DetailContent.swift
//  iWeather
//
//  Created by Jader Nunes on 14/11/21.
//

import UIKit

final class DetailContent: UIView {

    // MARK: - Elements

    private let errorComponent: ErrorComponent = initElement()
    private let emptyComponent: EmptyComponent = initElement()
    private let infoComponent: InfoWeatherComponent = initElement()

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
        addSubview(errorComponent)
        addSubview(emptyComponent)
        addSubview(infoComponent)
    }
}

// MARK: - Constraints

extension DetailContent {

    private func defineSubviewsConstraints() {
        errorComponent.anchor(self)
        emptyComponent.anchor(self)
        infoComponent.anchor(self)
    }
}

// MARK: - Component

extension DetailContent: Component {

    func render(with configuration: DetailState) {
        switch configuration {
            case .idle:
                stopLoader()
                errorComponent.isHidden = true
                emptyComponent.isHidden = true
                infoComponent.isHidden = true

            case .loading:
                startLoader(style: .large)
                errorComponent.isHidden = true
                emptyComponent.isHidden = true
                infoComponent.isHidden = true

            case .content(let viewModel):
                stopLoader()
                infoComponent.isVisible = true
                infoComponent.render(with: .content(viewModel: viewModel))
                errorComponent.isHidden = true
                emptyComponent.isHidden = true

            case .error:
                stopLoader()
                errorComponent.isVisible = true
                emptyComponent.isHidden = true
                infoComponent.isHidden = true

            case .empty:
                stopLoader()
                emptyComponent.isVisible = true
                errorComponent.isHidden = true
                infoComponent.isHidden = true
        }
    }
}
