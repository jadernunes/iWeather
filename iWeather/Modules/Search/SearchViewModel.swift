//
//  SearchViewModel.swift
//  iWeather
//
//  Created by Jader Nunes on 13/11/21.
//

protocol SearchViewModelProtocol {
    var title: String { get }

    func openDetail(index: Int)
}

final class SearchViewModel: SearchViewModelProtocol {

    // MARK: - Attributes

    private let coordinator: SearchCoordinatorProtocol?

    var title: String { R.string.localizable.searchTitle() }

    // MARK: - Life cycle

    init(coordinator: SearchCoordinatorProtocol? = nil) {
        self.coordinator = coordinator
    }

    // MARK: - Custom methods

    func openDetail(index: Int) {
        //TODO: Handle
    }
}
