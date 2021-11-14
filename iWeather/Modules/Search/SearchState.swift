//
//  SearchState.swift
//  iWeather
//
//  Created by Jader Nunes on 14/11/21.
//

import Foundation

enum SearchState {
    case idle, loading, empty, error, content(viewModel: ListWeatherViewModelProtocol)
}
