//
//  SearchViewModel.swift
//  iWeather
//
//  Created by Jader Nunes on 13/11/21.
//

protocol SearchViewModelProtocol: AnyObject {
    var title: String { get }
    var state: Dynamic<SearchState> { get }

    func openDetail(index: Int)
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

    func openDetail(index: Int) {
        //TODO: Handle
    }

    func loadData() {
        state.value = .loading
        service.request(lat: -30.057203, long: -51.150769) { [weak self] response in
            switch response {
                case .success(let data):
                    self?.state.value = data.count > 0 ? .content : .empty
                case .failure(_ , _):
                    self?.state.value = .error
            }
        }
    }
}
