//
//  ColorForAroundYouPlaceType.swift
//  Greenify
//
//  Created by san016 on 11/02/25.
//

import SwiftUI

func colorForAroundYouPlaceType(_ type: AroundYouMapPlaceTypes) -> Color {
    switch type {
    case .municipalityEcopoint: return ColorPalette.darkGreen
    case .usedClothes: return ColorPalette.lightBrown  // Raccolta abiti usati
    case .ecopoint: return ColorPalette.lightGreen  // Ecopunto
    case .usedOils: return ColorPalette.lightYellow  // Raccolta oli usati
    case .any: return .blue  // Default o altro tipo generico
    }
}
