//
//  MapPlace.swift
//  Greenify
//
//  Created by san016 on 11/02/25.
//
import MapKit
import SwiftUI

class MapPlace: Identifiable {
    let id = UUID()
    let coordinates: CLLocationCoordinate2D
    let name: String
    let description: String

    init(coordinates: CLLocationCoordinate2D, name: String, description: String)
    {
        self.coordinates = coordinates
        self.name = name
        self.description = description
    }
}
