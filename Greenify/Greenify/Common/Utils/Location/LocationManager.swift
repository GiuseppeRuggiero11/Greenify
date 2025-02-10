//
//  LocationManager.swift
//  Greenify
//
//  Created by san016 on 10/02/25.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    @Published var lastLocation: CLLocation?

    override init() {
        super.init()
        manager.delegate = self
    }

    func requestLocation() {
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }

    func locationManager(
        _ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]
    ) {
        lastLocation = locations.last
        manager.stopUpdatingLocation()  // Ferma l'aggiornamento per risparmiare batteria
    }

    func locationManager(
        _ manager: CLLocationManager, didFailWithError error: Error
    ) {
        print("Errore localizzazione: \(error.localizedDescription)")
    }
}
