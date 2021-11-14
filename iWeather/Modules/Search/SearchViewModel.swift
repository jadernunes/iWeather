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

    var title: String { R.string.localizable.searchTitle() }
    let state = Dynamic<SearchState>(.idle)

    // MARK: - Life cycle

    init(coordinator: SearchCoordinatorProtocol? = nil,
         service: SearchServicesProtocol = SearchServices()) {
        self.coordinator = coordinator
        self.service = service
    }

    // MARK: - Custom methods

    func loadData() {
        state.value = .loading

        //TODO: Change later.
        /*
         We'll use CLLocation to load the location from user
         1. Check location permission
         2. If user didn't allowed, show alert to open settings from the app
         3. If enalbe get right info
         */
        let lat: Double = -30.057203
        let long: Double = -51.150769

        service.request(lat: lat, long: long) { [weak self] response in
            switch response {
                case .success(let data):
                    let viewModel = ListWeatherViewModel(data: data)
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
        //TODO: handle
        coordinator?.close()
    }
}
