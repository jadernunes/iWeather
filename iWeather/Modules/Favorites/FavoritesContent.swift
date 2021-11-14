//
//  FavoritesContent.swift
//  iWeather
//
//  Created by Jader Nunes on 14/11/21.
//

import UIKit

final class FavoritesContent: UIView {

    // MARK: - Elements

    private let errorComponent: ErrorComponent = initElement()
    private let emptyComponent: EmptyComponent = initElement()
    private let listWeatherComponent: ListWeatherComponent = initElement()

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
        addSubview(listWeatherComponent)
    }
}

// MARK: - Constraints

extension FavoritesContent {

    private func defineSubviewsConstraints() {
        errorComponent.anchor(self)
        emptyComponent.anchor(self)
        listWeatherComponent.anchor(self)
    }
}

// MARK: - Component

extension FavoritesContent: Component {

    func render(with configuration: FavoritesState) {
        switch configuration {
            case .idle:
                stopLoader()
                listWeatherComponent.isHidden = true
                errorComponent.isHidden = true
                emptyComponent.isHidden = true

            case .loading:
                startLoader(style: .large)
                listWeatherComponent.isHidden = true
                errorComponent.isHidden = true
                emptyComponent.isHidden = true

            case .content(let subViewModel):
                stopLoader()
                listWeatherComponent.isVisible = true
                listWeatherComponent.render(with: .content(viewModel: subViewModel))
                errorComponent.isHidden = true
                emptyComponent.isHidden = true

            case .error:
                stopLoader()
                errorComponent.isVisible = true
                emptyComponent.isHidden = true
                listWeatherComponent.isHidden = true

            case .empty:
                stopLoader()
                emptyComponent.isVisible = true
                errorComponent.isHidden = true
                listWeatherComponent.isHidden = true
        }
    }
}
