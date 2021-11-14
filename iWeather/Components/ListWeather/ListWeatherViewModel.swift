//
//  ListWeatherViewModel.swift
//  iWeather
//
//  Created by Jader Nunes on 14/11/21.
//

import Foundation

protocol ListWeatherDelegate: AnyObject {
    func didSelectWeather(_ weather: WeatherSearch?)
    func willAddWeather(_ weather: WeatherSearch?)
    func willRemoveWeather(_ weather: WeatherSearch?)
}

extension ListWeatherDelegate {
    func willAddWeather(_ weather: WeatherSearch?) { }
    func willRemoveWeather(_ weather: WeatherSearch?) { }
}

protocol ListWeatherViewModelProtocol: AnyObject {
    var countItems: Int { get }
    var canEdit: Bool { get }

    func viewModelCellAt(_ index: Int) -> WeatherCellViewModelProtocol?
    func selectWeather(index: Int)
    func removeWeather(index: Int)
}

final class ListWeatherViewModel: ListWeatherViewModelProtocol {

    // MARK: - Attributes

    private let actions: [ListTypeAction]
    private var data: [WeatherSearch]
    weak var delegate: ListWeatherDelegate?

    var countItems: Int { data.count }
    var canEdit: Bool { actions.contains { $0 == .edit } }

    // MARK: - Life cycle

    init(data: [WeatherSearch], actions: [ListTypeAction]) {
        self.data = data
        self.actions = actions
        sort()
    }

    // MARK: - Custom methods

    private func sort() {
        //TODO: Create an action that user can choose which search they prefere
        data.sort(by: { $0.distance < $1.distance })
    }

    func viewModelCellAt(_ index: Int) -> WeatherCellViewModelProtocol? {
        guard let weather = data[safe: index] else { return nil }

        let canAdd = actions.contains { $0 == .add }
        let viewModel = WeatherCellViewModel(weather: weather, canAdd: canAdd)
        viewModel.delegate = self
        return viewModel
    }

    func selectWeather(index: Int) {
        delegate?.didSelectWeather(data[safe: index])
    }

    func removeWeather(index: Int) {
        delegate?.willRemoveWeather(data[safe: index])
    }
}

// MARK: - WeatherCell delegate

extension ListWeatherViewModel: WeatherCellContentDelegate {

    func addButtonPressed(weather: WeatherSearch) {
        delegate?.willAddWeather(weather)
    }
}
