//
//  CustomMapViewModel.swift
//  Greenify
//
//  Created by san016 on 10/02/25.
//

import Combine
import MapKit
import SwiftUI

class AroundYouMapViewModel: ObservableObject {

    private var cancellables = Set<AnyCancellable>()

    @ObservedObject private var locationManager = LocationManager()

    @Published public var ecopointsFilterChecked: Bool = true
    @Published public var usedOilsFilterChecked: Bool = true
    @Published public var usedClothesFilterChecked: Bool = true

    @Published public var showAroundYouMapPlaceSheet: Bool = false
    @Published public var selectedMapPlace: AroundYouMapPlace?

    @Published public var currentPosition: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: 41.1303614, longitude: 14.7786118),
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    )

    private let staticMapPlaces: [AroundYouMapPlace] = [
        AroundYouMapPlace(
            coordinates: CLLocationCoordinate2D(
                latitude: 41.14920651191567, longitude: 14.781719048799813),
            name: "Ecopunto Acquafredda",
            description: "Ecopunto Acquafredda",
            type: .ecopoint),
        AroundYouMapPlace(
            coordinates: CLLocationCoordinate2D(
                latitude: 41.16839892604713, longitude: 14.794164498628914),
            name: "Ecopunto Piano Borea",
            description: "Ecopunto Piano Borea",
            type: .ecopoint),
        AroundYouMapPlace(
            coordinates: CLLocationCoordinate2D(
                latitude: 41.198341656517464, longitude: 14.781124775673744),
            name: "Ecopunti Panelli",
            description: "Ecopunti Panelli",
            type: .ecopoint),
        AroundYouMapPlace(
            coordinates: CLLocationCoordinate2D(
                latitude: 41.18148953778217, longitude: 14.739425739041137),
            name: "Ecopunti Cardoncelli",
            description: "Ecopunti Cardoncelli",
            type: .ecopoint),
        AroundYouMapPlace(
            coordinates: CLLocationCoordinate2D(
                latitude: 41.182348226854494, longitude: 14.744673022844163),
            name: "Ecopunto Olivola",
            description: "Ecopunto Olivola",
            type: .ecopoint),
        AroundYouMapPlace(
            coordinates: CLLocationCoordinate2D(
                latitude: 41.18883997433878, longitude: 14.761195430375901),
            name: "Ecopunto San Vitale-Pantano",
            description: "Ecopunto San Vitale-Pantano",
            type: .ecopoint),
        AroundYouMapPlace(
            coordinates: CLLocationCoordinate2D(
                latitude: 41.105789647767956, longitude: 14.746328451031054),
            name: "Ecopunto Pontecorvo",
            description: "Ecopunto Pontecorvo",
            type: .ecopoint),
        AroundYouMapPlace(
            coordinates: CLLocationCoordinate2D(
                latitude: 41.113851664634865, longitude: 14.768521559406809),
            name: "Ecopunto Montecalvo",
            description: "Ecopunto Montecalvo",
            type: .ecopoint),
        AroundYouMapPlace(
            coordinates: CLLocationCoordinate2D(
                latitude: 41.113773374444634, longitude: 14.821035747687622),
            name: "Ecopunto Piano Cappelle",
            description: "Ecopunto Piano Cappelle",
            type: .ecopoint),
        AroundYouMapPlace(
            coordinates: CLLocationCoordinate2D(
                latitude: 41.135497319288476, longitude: 14.802496318976685),
            name: "Ecopunto Via Novelli",
            description: "Ecopunto Via Novelli",
            type: .ecopoint),

        // USED OILS
        AroundYouMapPlace(
            coordinates: CLLocationCoordinate2D(
                latitude: 41.108835543786725, longitude: 14.746975352898408),
            name: "Raccolta oli Montecorvo",
            description: "Raccolta oli Montecorvo",
            type: .usedOils),
        AroundYouMapPlace(
            coordinates: CLLocationCoordinate2D(
                latitude: 41.14065829999999, longitude: 14.795829900000003),
            name: "Raccolta oli Ecocentro ASIA",
            description: "Raccolta oli Ecocentro ASIA",
            type: .usedOils),
        AroundYouMapPlace(
            coordinates: CLLocationCoordinate2D(
                latitude: 41.14735510000001, longitude: 14.755165100000012),
            name: "Raccolta oli San Vitale",
            description: "Raccolta oli San Vitale",
            type: .usedOils),
        AroundYouMapPlace(
            coordinates: CLLocationCoordinate2D(
                latitude: 41.16959589999999, longitude: 14.795313100000008),
            name: "Raccolta oli Piano Borea",
            description: "Raccolta oli Piano Borea",
            type: .usedOils),

        // USED CLOTHES
        AroundYouMapPlace(
            coordinates: CLLocationCoordinate2D(
                latitude: 41.112662, longitude: 14.766971000000018),
            name: "Raccolta Abiti Contrada Madonna della Salute",
            description: "Raccolta Abiti Contrada Madonna della Salute",
            type: .usedClothes),
        AroundYouMapPlace(
            coordinates: CLLocationCoordinate2D(
                latitude: 41.10993099999999, longitude: 14.75466199999999),
            name: "Raccolta Abiti Contrada Pontecorvo",
            description: "Raccolta Abiti Contrada Pontecorvo",
            type: .usedClothes),
        AroundYouMapPlace(
            coordinates: CLLocationCoordinate2D(
                latitude: 41.147527100000005, longitude: 14.75515360000002),
            name: "Raccolta Abiti Contrada San Vitale",
            description: "Raccolta Abiti Contrada San Vitale",
            type: .usedClothes),
        AroundYouMapPlace(
            coordinates: CLLocationCoordinate2D(
                latitude: 41.17056299999997, longitude: 14.735563999999991),
            name: "Raccolta Abiti Contrada Olivola",
            description: "Raccolta Abiti Contrada Olivola", type: .usedClothes),
        AroundYouMapPlace(
            coordinates: CLLocationCoordinate2D(
                latitude: 41.198555200000015, longitude: 14.781757700000012),
            name: "Raccolta Abiti Contrada Panelli",
            description: "Raccolta Abiti Contrada Panelli", type: .usedClothes),
        AroundYouMapPlace(
            coordinates: CLLocationCoordinate2D(
                latitude: 41.15809099999999, longitude: 14.76387600000001),
            name: "Raccolta Abiti Contrada Cardoncelli",
            description: "Raccolta Abiti Contrada Cardoncelli",
            type: .usedClothes),
    ]

    public var mapPlaces: [AroundYouMapPlace] {
        return self.staticMapPlaces.filter {
            if $0.type == .usedClothes && !usedClothesFilterChecked {
                return false
            } else if $0.type == .ecopoint && !ecopointsFilterChecked {
                return false
            } else if $0.type == .usedOils && !usedOilsFilterChecked {
                return false
            } else {
                return true
            }
        }
    }
    
    public var hasMapPlaces: Bool {
        return !mapPlaces.isEmpty
    }

    init() {
        self.locationManager = locationManager
        self.locationManager.requestLocation()
        self.observeLocationChanges()
    }

    func onDidTapAroundYouMapPlace(_ place: AroundYouMapPlace) {
        selectedMapPlace = place
        showAroundYouMapPlaceSheet = true
    }

    func onDidTapSheetCloseButton() {
        showAroundYouMapPlaceSheet = false
        selectedMapPlace = nil
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

    deinit {
        cancellables.forEach({ e in
            e.cancel()
        })
    }

}
