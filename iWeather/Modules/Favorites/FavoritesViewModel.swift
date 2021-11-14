//
//  FavoritesViewModel.swift
//  iWeather
//
//  Created by Jader Nunes on 13/11/21.
//

import Rswift

protocol FavoritesViewModelProtocol: AnyObject {
    var title: String { get }
    var state: Dynamic<FavoritesState> { get }

    func loadData()
    func openSearch()
}

final class FavoritesViewModel: FavoritesViewModelProtocol {
    
    // MARK: - Attributes

    private let coordinator: FavoritesCoordinatorProtocol?
    private let favorite: FavoriteProtocol

    var title: String { R.string.localizable.favoritesTitle() }
    let state = Dynamic<FavoritesState>(.idle)

    // MARK: - Life cycle

    init(coordinator: FavoritesCoordinatorProtocol? = nil,
         favorite: FavoriteProtocol =  FavoriteManager()) {
        self.coordinator = coordinator
        self.favorite = favorite
    }

    // MARK: - Custom methods

    func loadData() {
        state.value = .loading

        DispatchQueue
            .global(qos: DispatchQoS.QoSClass.default)
            .async { [weak self] in
                let data = self?.favorite.loadAll() ?? []
                let viewModel = ListWeatherViewModel(data: data, actions: [.edit])
                viewModel.delegate = self
                self?.state.value = data.count > 0
                    ? .content(viewModel: viewModel)
                    : .empty
            }
    }

    func openSearch() {
        coordinator?.openSearch()
    }
}

// MARK: - ListWeather delegate

extension FavoritesViewModel: ListWeatherDelegate {

    func willRemoveWeather(_ weather: WeatherSearch?) {
        favorite.remove(id: weather?.woeid ?? 0)
        loadData()
    }

    func didSelectWeather(_ weather: WeatherSearch?) {
        coordinator?.openDetail(woeid: weather?.woeid ?? -1)
    }
}

