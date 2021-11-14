//
//  InfoWeatherViewModel.swift
//  iWeather
//
//  Created by Jader Nunes on 14/11/21.
//

import Foundation

protocol InfoWeatherViewModelProtocol: AnyObject {
    var cityName: String? { get }
    var dateToday: String? { get }
    var currentTemp: String? { get }
    var minTemp: String? { get }
    var maxTemp: String? { get }
    var weatherTypeName: String? { get }
    var weatherIconPath: String { get }
}

final class InfoWeatherViewModel: InfoWeatherViewModelProtocol {

    // MARK: - Attributes

    private let weather: Weather
    private var weatherToday: WeatherDay? {
        //TODO: Change the logic and component to show the list of all days
        weather.weatherDays.filter { $0.date.day == Date().day }.first
    }

    var cityName: String? { weather.title }
    var dateToday: String? { weatherToday?.date.toString() }
    var currentTemp: String? { (weatherToday?.currentTemp.formatted() ?? "-") + "º" }
    var minTemp: String? { "L: \(weatherToday?.minTemp.formatted() ?? "-")º" }
    var maxTemp: String? { "H: \(weatherToday?.maxTemp.formatted() ?? "-")º" }
    var weatherTypeName: String? { weatherToday?.weatherStateName }
    var weatherIconPath: String { Config.urlImage(imageName: weatherToday?.weatherStateCode ?? "") }

    // MARK: - Life cycle

    init(weather: Weather) {
        self.weather = weather
    }
}
