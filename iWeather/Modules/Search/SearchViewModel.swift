//
//  SearchViewModel.swift
//  iWeather
//
//  Created by Jader Nunes on 13/11/21.
//

import Combine

protocol SearchViewModelProtocol: AnyObject {
    var title: CurrentValueSubject<String, Never> { get }
    var state: CurrentValueSubject<SearchState, Never> { get }

    func loadData()
}

final class SearchViewModel: SearchViewModelProtocol {

    // MARK: - Attributes

    private let coordinator: SearchCoordinatorProtocol?
    private let service: SearchServicesProtocol
    private let favorite: FavoriteProtocol
    private let locationManager: LocationManagerProtocol

    let title = CurrentValueSubject<String, Never>(R.string.localizable.searchTitle())
    let state = CurrentValueSubject<SearchState, Never>(.idle)

    // MARK: - Life cycle

    init(coordinator: SearchCoordinatorProtocol? = nil,
         service: SearchServicesProtocol = SearchServices(),
         favorite: FavoriteProtocol = FavoriteManager(),
         locationManager: LocationManagerProtocol = LocationManager()) {
        self.coordinator = coordinator
        self.service = service
        self.favorite = favorite
        self.locationManager = locationManager
        self.locationManager.delegate = self
    }

    // MARK: - Custom methods

    func loadData() {
        state.send(.loading)
        locationManager.requestLocation()
    }

    private func requestData(lat: Double, long: Double) {
        service.request(lat: lat, long: long) { [weak self] in
            switch $0 {
            case .success(let data):
                let viewModel = ListWeatherViewModel(data: data, actions: [.add])
                viewModel.delegate = self

                self?.state.send(data.count > 0
                                 ? .content(viewModel: viewModel)
                                 : .empty)
            case .failure:
                self?.state.send(.error)
            }
        }
    }
}

// MARK: - ListWeather delegate

extension SearchViewModel: ListWeatherDelegate {

    func didSelectWeather(_ weather: WeatherSearch?) {
        coordinator?.openDetail(woeid: weather?.woeid ?? -1)
    }

    func willAddWeather(_ weather: WeatherSearch?) {
        guard let weather = weather else { return }
        favorite.add(model: weather)
        coordinator?.close()
    }
}

// MARK: - Location delegate

extension SearchViewModel: LocationManagerDelegate {

    func didReceiveError() {
        state.send(.error)
    }

    func didReceiveLocation(lat: Double, long: Double) {
        requestData(lat: lat, long: long)
    }
}
