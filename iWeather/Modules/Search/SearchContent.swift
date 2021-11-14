//
//  SearchContent.swift
//  iWeather
//
//  Created by Jader Nunes on 13/11/21.
//

import UIKit

enum SearchState {
    case idle, loading, empty, error, content
}

final class SearchContent: UIView {

    // MARK: - Elements

    private let errorComponent: ErrorComponent = initElement()
    private let emptyComponent: EmptyComponent = initElement()

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
    }
}

// MARK: - Constraints

extension SearchContent {

    private func defineSubviewsConstraints() {
        errorComponent.anchor(self)
        emptyComponent.anchor(self)
    }
}

// MARK: - Component

extension SearchContent: Component {

    func render(with configuration: SearchState) {
        switch configuration {
            case .idle:
                stopLoader()
                errorComponent.isHidden = true
                emptyComponent.isHidden = true

            case .loading:
                startLoader(style: .large)
                errorComponent.isHidden = true
                emptyComponent.isHidden = true

            case .content:
                stopLoader()
                errorComponent.isHidden = true
                emptyComponent.isHidden = true

            case .error:
                stopLoader()
                errorComponent.isVisible = true
                emptyComponent.isHidden = true

            case .empty:
                stopLoader()
                errorComponent.isHidden = true
                emptyComponent.isVisible = true
        }
    }
}
