//
//  MapPlace.swift
//  Greenify
//
//  Created by san016 on 10/02/25.
//
import MapKit
import SwiftUI

class AroundYouMapPlace: MapPlace {
    var type: AroundYouMapPlaceTypes
    init(
        coordinates: CLLocationCoordinate2D, name: String, description: String,
        type: AroundYouMapPlaceTypes
    ) {
        self.type = type
        super.init(
            coordinates: coordinates, name: name, description: description)

    }

}
