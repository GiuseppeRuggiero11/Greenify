//
//  CustomMapViewModel.swift
//  Greenify
//
//  Created by san016 on 10/02/25.
//

import Combine
import MapKit
import SwiftUI

class CustomMapViewModel: ObservableObject {
    @ObservedObject private var locationManager = LocationManager()
    @Published public var currentPosition: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: 47.499167, longitude: 8.726667),
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    )

    @Published var mapPlaces: [MapPlace] = [
        MapPlace(
            coordinates: CLLocationCoordinate2D(
                latitude: 41.14920651191567, longitude: 14.781719048799813),
            name: "Ecopunto Acquafredda",
            description: "bla bla bla"),
        MapPlace(
            coordinates: CLLocationCoordinate2D(
                latitude: 41.16839892604713, longitude: 14.794164498628914),
            name: "Ecopunto Piano Borea",
            description: "bla bla bla"),
        MapPlace(
            coordinates: CLLocationCoordinate2D(
                latitude: 41.198341656517464, longitude: 14.781124775673744),
            name: "Ecopunti Panelli",
            description: "bla bla bla"),
        MapPlace(
            coordinates: CLLocationCoordinate2D(
                latitude: 41.18148953778217, longitude: 14.739425739041137),
            name: "Ecopunto Olivola",
            description: "bla bla bla"),
    ]

    init() {
        self.locationManager = locationManager
        self.locationManager.requestLocation()
        self.observeLocationChanges()
    }

    func observeLocationChanges() {
        locationManager.$lastLocation
            .sink { newLocation in
                if let location = newLocation {
                    self.currentPosition = .region(
                        MKCoordinateRegion(
                            center: .init(
                                latitude: location.coordinate
                                    .latitude,
                                longitude: location.coordinate
                                    .longitude),
                            span: .init(latitudeDelta: 0.2, longitudeDelta: 0.2)
                        ))
                } else {
                    //...
                }
            }
            .store(in: &cancellables)
    }

    private var cancellables = Set<AnyCancellable>()

}
