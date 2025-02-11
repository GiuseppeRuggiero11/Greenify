//
//  ColorForAroundYouPlaceType.swift
//  Greenify
//
//  Created by san016 on 11/02/25.
//

import SwiftUI

func colorForAroundYouPlaceType(_ type: AroundYouMapPlaceTypes) -> Color {
    switch type {
    case .any:
        return .yellow
    case .ecopoint:
        return .red.opacity(0.8)
    case .usedClothes:
        return .brown
    case .usedOils:
        return .yellow
    }
}
