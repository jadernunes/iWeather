//
//  ListWeatherViewModel.swift
//  iWeather
//
//  Created by Jader Nunes on 14/11/21.
//

import Foundation

protocol ListWeatherDelegate: AnyObject {
    func willAddWeather(_ weather: WeatherSearch?)
    func didSelectWeather(_ weather: WeatherSearch?)
}

protocol ListWeatherViewModelProtocol: AnyObject {
    var countItems: Int { get }

    func viewModelCellAt(_ index: Int) -> WeatherCellViewModelProtocol?
    func selectWeather(index: Int)
}

final class ListWeatherViewModel: ListWeatherViewModelProtocol {

    // MARK: - Attributes

    private var data: [WeatherSearch]
    weak var delegate: ListWeatherDelegate?

    var countItems: Int { data.count }

    // MARK: - Life cycle

    init(data: [WeatherSearch]) {
        self.data = data
        sort()
    }

    // MARK: - Custom methods

    private func sort() {
        data.sort(by: { $0.distance < $1.distance })
    }

    func viewModelCellAt(_ index: Int) -> WeatherCellViewModelProtocol? {
        guard let weather = data[safe: index] else { return nil }
        let viewModel = WeatherCellViewModel(weather: weather)
        viewModel.delegate = self
        return viewModel
    }

    func selectWeather(index: Int) {
        delegate?.didSelectWeather(data[safe: index])
    }
}

// MARK: - WeatherCell delegate

extension ListWeatherViewModel: WeatherCellContentDelegate {

    func addButtonPressed(weather: WeatherSearch) {
        delegate?.willAddWeather(weather)
    }
}
