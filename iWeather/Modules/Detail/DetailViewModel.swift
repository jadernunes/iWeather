//
//  DetailViewModel.swift
//  iWeather
//
//  Created by Jader Nunes on 14/11/21.
//

protocol DetailViewModelProtocol: AnyObject {
    var title: String { get }
    var state: Dynamic<DetailState> { get }

    func loadData()
}

final class DetailViewModel: DetailViewModelProtocol {

    // MARK: - Attributes

    private let woeid: Int64
    private let coordinator: DetailCoordinatorProtocol?
    private let service: DetailServicesProtocol

    var title: String { R.string.localizable.detailTitle() }
    let state = Dynamic<DetailState>(.idle)

    // MARK: - Life cycle

    init(coordinator: DetailCoordinatorProtocol? = nil,
         woeid: Int64,
         service: DetailServicesProtocol = DetailServices()) {
        self.coordinator = coordinator
        self.woeid = woeid
        self.service = service
    }

    // MARK: - Custom methods

    func loadData() {
        state.value = .loading
        service.request(woeid: woeid) { [weak self] response in
            switch response {
                case .success(let data):
                    self?.state.value = .content(viewModel: InfoWeatherViewModel(weather: data))
                case .failure(_ , _):
                    self?.state.value = .error
            }
        }
    }
}
