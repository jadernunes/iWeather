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

    private let woeid: Int
    private let coordinator: DetailCoordinatorProtocol?

    var title: String { R.string.localizable.detailTitle() }
    let state = Dynamic<DetailState>(.idle)

    // MARK: - Life cycle

    init(coordinator: DetailCoordinatorProtocol? = nil, woeid: Int) {
        self.coordinator = coordinator
        self.woeid = woeid
    }

    // MARK: - Custom methods

    func loadData() {
        //TODO: handle
    }
}
