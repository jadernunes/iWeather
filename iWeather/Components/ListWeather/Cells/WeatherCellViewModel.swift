//
//  WeatherCellViewModel.swift
//  iWeather
//
//  Created by Jader Nunes on 14/11/21.
//

protocol WeatherCellContentDelegate: AnyObject {
    func addButtonPressed(weather: WeatherSearch)
}

protocol WeatherCellViewModelProtocol: AnyObject {
    var title: String { get }

    func addWeather()
}

final class WeatherCellViewModel: WeatherCellViewModelProtocol {

    // MARK: - Attributes

    private let weather: WeatherSearch
    weak var delegate: WeatherCellContentDelegate?

    var title: String { weather.title }

    // MARK: - Life cycle

    init(weather: WeatherSearch) {
        self.weather = weather
    }

    func addWeather() {
        delegate?.addButtonPressed(weather: weather)
    }
}
