//
//  FavoritesViewModel.swift
//  iWeather
//
//  Created by Jader Nunes on 13/11/21.
//

import Rswift

protocol FavoritesViewModelProtocol {
    var title: String { get }

    func openSearch()
}

final class FavoritesViewModel: FavoritesViewModelProtocol {
    
    // MARK: - Attributes

    private let coordinator: FavoritesCoordinatorProtocol?

    var title: String { R.string.localizable.favoritesTitle() }

    // MARK: - Life cycle

    init(coordinator: FavoritesCoordinatorProtocol? = nil) {
        self.coordinator = coordinator
    }

    // MARK: - Custom methods

    func openSearch() {
        coordinator?.openSearch()
    }
}
