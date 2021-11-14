//
//  LocationManager.swift
//  iWeather
//
//  Created by Jader Nunes on 14/11/21.
//

import CoreLocation

protocol LocationManagerDelegate: AnyObject {
    func didReceiveError()
    func didReceiveLocation(lat: Double, long: Double)
}

protocol LocationManagerProtocol: AnyObject {
    func requestLocation()
    var delegate: LocationManagerDelegate? { get set }
}

final class LocationManager: NSObject, LocationManagerProtocol {

    // MARK: - Attributes

    private let manager: CLLocationManager
    weak var delegate: LocationManagerDelegate?

    // MARK: - Life cycle

    init(manager: CLLocationManager = CLLocationManager()) {
        self.manager = manager
        super.init()
        manager.delegate = self
    }

    // MARK: - Custom methods

    func requestLocation() {
        //TODO: handle user authorization right
        let status = CLLocationManager.authorizationStatus()
        switch status {
            case .authorizedAlways, .authorizedWhenInUse:
                manager.requestLocation()
            default:
                manager.requestWhenInUseAuthorization()
        }
    }
}

// MARK: - CLLocation delegate

extension LocationManager: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            delegate?.didReceiveLocation(lat: location.coordinate.latitude,
                                         long: location.coordinate.longitude)
        } else {
            delegate?.didReceiveError()
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        delegate?.didReceiveError()
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        requestLocation()
    }
}
