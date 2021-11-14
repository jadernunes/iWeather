//
//  SearchViewModelTests.swift
//  iWeatherTests
//
//  Created by Jader Nunes on 14/11/21.
//

import XCTest
@testable import iWeather

final class SearchViewModelTests: XCTestCase {

    override func setUp() {

        super.setUp()
        UserDefaultsMock.resetStandardUserDefaults()
    }

    func testSearchViewModel() {
        let model = [WeatherSearch(distance: 845594, title: "title", woeid: 468739)]
        let mock = AFMock(data: model)
        let service = SearchServices(networkManager: mock)

        let locationManager = LocationManagerMock()

        let favorite = FavoriteManager(database: DatabaseManager(database: UserDefaultsMock.standard))
        let viewModel = SearchViewModel(service: service,
                                        favorite: favorite,
                                        locationManager: locationManager)
        locationManager.delegate = viewModel

        XCTAssertEqual(viewModel.state.value, .idle)
        viewModel.loadData()

        XCTAssertEqual(viewModel.state.value, .content(viewModel: ListWeatherViewModel(data: model,
                                                                                       actions: [.add])))
        XCTAssertEqual(viewModel.title, R.string.localizable.searchTitle())
    }
}

final class LocationManagerMock: LocationManagerProtocol {

    var delegate: LocationManagerDelegate?

    func requestLocation() {
        delegate?.didReceiveLocation(lat: 0, long: 0)
    }
}
