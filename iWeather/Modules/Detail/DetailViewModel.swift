//
//  DetailViewModel.swift
//  iWeather
//
//  Created by Jader Nunes on 14/11/21.
//

import Combine

protocol DetailViewModelProtocol: AnyObject {
    var title: CurrentValueSubject<String, Never> { get }
    var state: CurrentValueSubject<DetailState, Never> { get }

    func loadData()
}

final class DetailViewModel: DetailViewModelProtocol {

    // MARK: - Attributes

    private let woeid: Int64
    private let coordinator: DetailCoordinatorProtocol?
    private let service: DetailServicesProtocol

    let title = CurrentValueSubject<String, Never>(R.string.localizable.detailTitle())
    let state = CurrentValueSubject<DetailState, Never>(.idle)

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
        state.send(.loading)
        service.request(woeid: woeid) { [weak self] in
            switch $0 {
            case .success(let data):
                self?.state.send(.content(viewModel: InfoWeatherViewModel(weather: data)))
            case .failure:
                self?.state.send(.error)
            }
        }
    }
}
