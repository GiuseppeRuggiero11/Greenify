//
//  CustomMapView.swift
//  Greenify
//
//  Created by san016 on 10/02/25.
//

import MapKit
import SwiftUI

struct CustomMapView: View {

    @StateObject private var viewModel = CustomMapViewModel()

    var body: some View {
        VStack {
            Map(position: $viewModel.currentPosition) {
                MapCircle(
                    center: viewModel.currentPosition.region?.center
                        ?? .init(latitude: 47.499167, longitude: 8.726667),
                    radius: 500
                )
                .foregroundStyle(Color(white: 0.4, opacity: 0.25))
                .stroke(.orange, lineWidth: 2)
                UserAnnotation()
                
                ForEach(viewModel.mapPlaces){ place in
                    Marker(place.name, coordinate: place.coordinates).tint(.yellow)
                }
                
            }
        }.toolbarTitleDisplayMode(.automatic).toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Text("AroundYou").font(.system(size: 22))
            }
        }.ignoresSafeArea(.all)
    }
}

#Preview {
    CustomMapView()
}
