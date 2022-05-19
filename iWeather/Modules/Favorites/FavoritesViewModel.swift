//
//  FavoritesViewModel.swift
//  iWeather
//
//  Created by Jader Nunes on 13/11/21.
//

import Rswift
import Combine

protocol FavoritesViewModelProtocol: AnyObject {
    var title: CurrentValueSubject<String, Never> { get }
    var state: CurrentValueSubject<FavoritesState, Never> { get }

    func loadData()
    func openSearch()
}

final class FavoritesViewModel: FavoritesViewModelProtocol {
    
    // MARK: - Attributes

    private let coordinator: FavoritesCoordinatorProtocol?
    private let favorite: FavoriteProtocol

    let title = CurrentValueSubject<String, Never>(R.string.localizable.favoritesTitle())
    let state = CurrentValueSubject<FavoritesState, Never>(.idle)

    // MARK: - Life cycle

    init(coordinator: FavoritesCoordinatorProtocol? = nil,
         favorite: FavoriteProtocol =  FavoriteManager()) {
        self.coordinator = coordinator
        self.favorite = favorite
    }

    // MARK: - Custom methods

    func loadData() {
        state.send(.loading)

        DispatchQueue
            .global(qos: DispatchQoS.QoSClass.default)
            .async { [weak self] in
                let data = self?.favorite.loadAll() ?? []
                let viewModel = ListWeatherViewModel(data: data, actions: [.edit])
                viewModel.delegate = self
                self?.state.send(data.count > 0
                                 ? .content(viewModel: viewModel)
                                 : .empty)
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
