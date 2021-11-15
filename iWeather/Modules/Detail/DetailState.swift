//
//  DetailState.swift
//  iWeather
//
//  Created by Jader Nunes on 14/11/21.
//

import Foundation

enum DetailState: Equatable {
    case idle, loading, empty, error, content(viewModel: InfoWeatherViewModelProtocol)

    static func == (lhs: DetailState, rhs: DetailState) -> Bool {
        switch (lhs, rhs) {
            case (idle, idle),
                 (loading, loading),
                 (empty, empty),
                 (error, error),
                 (content(_), content(_)):
                return true
            default:
                return false
        }
    }
}
