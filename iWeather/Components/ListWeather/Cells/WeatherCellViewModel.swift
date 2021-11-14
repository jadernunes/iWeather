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
    var shouldShowAdd: Bool { get }

    func addWeather()
}

final class WeatherCellViewModel: WeatherCellViewModelProtocol {

    // MARK: - Attributes

    private let canAdd: Bool
    private let weather: WeatherSearch
    weak var delegate: WeatherCellContentDelegate?

    var title: String { weather.title }
    var shouldShowAdd: Bool { canAdd }

    // MARK: - Life cycle

    init(weather: WeatherSearch, canAdd: Bool) {
        self.weather = weather
        self.canAdd = canAdd
    }

    func addWeather() {
        delegate?.addButtonPressed(weather: weather)
    }
}
