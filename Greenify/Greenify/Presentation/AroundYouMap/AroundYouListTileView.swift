//
//  AroundYouListTileView.swift
//  Greenify
//
//  Created by san016 on 12/02/25.
//

import MapKit
import SwiftUI

struct AroundYouListTileView: View {
    let aroundYouPlace: AroundYouMapPlace
    var body: some View {
        HStack {
            // Icona stile Apple
            Image(systemName: "mappin")
                .foregroundColor(.blue)
                .frame(width: 30, height: 30)

            VStack(alignment: .leading, spacing: 2) {
                Text(aroundYouPlace.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(aroundYouPlace.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)

            }.padding(.horizontal)
            Spacer()

            // Icona freccia per navigazione
            Image(systemName: "info.circle")
                .foregroundColor(.gray)
                .font(.system(size: 14, weight: .semibold))
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))  // Colore stile iOS
        //.cornerRadius(10)
        //.padding(.horizontal)
    }
}
