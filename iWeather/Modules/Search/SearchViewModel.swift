//
//  SearchViewModel.swift
//  iWeather
//
//  Created by Jader Nunes on 13/11/21.
//

protocol SearchViewModelProtocol: AnyObject {
    var title: String { get }
    var state: Dynamic<SearchState> { get }

    func loadData()
}

final class SearchViewModel: SearchViewModelProtocol {

    // MARK: - Attributes

    private let coordinator: SearchCoordinatorProtocol?
    private let service: SearchServicesProtocol
    private let favorite: FavoriteProtocol
    private let locationManager: LocationManagerProtocol

    var title: String { R.string.localizable.searchTitle() }
    let state = Dynamic<SearchState>(.idle)

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
        state.value = .loading
        locationManager.requestLocation()
    }

    private func requestData(lat: Double, long: Double) {
        service.request(lat: lat, long: long) { [weak self] response in
            switch response {
                case .success(let data):
                    let viewModel = ListWeatherViewModel(data: data, actions: [.add])
                    viewModel.delegate = self

                    self?.state.value = data.count > 0 ? .content(viewModel: viewModel) : .empty
                case .failure(_ , _):
                    self?.state.value = .error
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
        state.value = .error
    }

    func didReceiveLocation(lat: Double, long: Double) {
        requestData(lat: lat, long: long)
    }
}
