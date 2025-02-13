//
//  CustomMapView.swift
//  Greenify
//
//  Created by san016 on 10/02/25.
//

import MapKit
import SwiftUI

struct AroundYouMapView: View {

    @StateObject private var viewModel = AroundYouMapViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {

                    Map(position: $viewModel.currentPosition) {
                        MapCircle(
                            center: viewModel.currentPosition.region?.center
                                ?? .init(
                                    latitude: 47.499167, longitude: 8.726667),
                            radius: 500
                        )
                        .foregroundStyle(Color(white: 0.4, opacity: 0.25))
                        .stroke(.orange, lineWidth: 2)
                        UserAnnotation()
                        ForEach(viewModel.mapPlaces) { place in

                            Annotation(
                                place.name, coordinate: place.coordinates
                            ) {
                                VStack {
                                    Image(systemName: "mappin.circle.fill")
                                        .font(.title)
                                        .foregroundColor(
                                            colorForAroundYouPlaceType(
                                                place.type)
                                        )
                                        .onTapGesture {
                                            viewModel.onDidTapAroundYouMapPlace(
                                                place)
                                        }
                                }
                            }

                        }
                    }.aspectRatio(contentMode: .fit).ignoresSafeArea()//.frame(height: 370)

                    ForEach(viewModel.mapPlaces) { place in
                        VStack(spacing: 0) {
                            AroundYouListTileView(aroundYouPlace: place)
                                .onTapGesture {
                                    viewModel.onDidTapAroundYouMapPlace(place)
                                }
                            Divider()
                                .background(Color(UIColor.systemGray4))
                        }
                    }

                }.toolbarTitleDisplayMode(.inline).toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Text("Around You").font(.system(size: 26))
                            .bold(true)
                    }
                    ToolbarItem(placement: .topBarTrailing) {

                        Menu {
                            Toggle(
                                "Ecopoint",
                                isOn: $viewModel.ecopointsFilterChecked)

                            Toggle(
                                "Used clothes",
                                isOn: $viewModel.usedClothesFilterChecked)
                            Toggle(
                                "Used oils",
                                isOn: $viewModel.usedOilsFilterChecked)
                        } label: {
                            Label(
                                "Filters",
                                systemImage: "line.3.horizontal.decrease.circle"
                            )
                            .font(.title2)
                        }
                        .padding()

                    }
                }.sheet(isPresented: $viewModel.showAroundYouMapPlaceSheet) {
                    if let selectedMapPlace = viewModel.selectedMapPlace {
                        VStack {
                            HStack {
                                Text("\(selectedMapPlace.type)".capitalized)
                                    .font(.system(size: 26)).padding(
                                        .horizontal)
                                Spacer()

                                Button(action: {
                                    viewModel.onDidTapSheetCloseButton()
                                }) {
                                    Image(systemName: "chevron.down.circle")
                                        .resizable().frame(
                                            width: 22, height: 22
                                        )
                                        .padding(
                                            .horizontal
                                        )
                                }

                            }.padding(.vertical)

                            AroundYouListTileView(
                                aroundYouPlace: selectedMapPlace)
                            Spacer()
                        }

                    } else {
                        // EmptyView()
                    }

                }
                //.ignoresSafeArea(.all)
            }
        }

    }
}

#Preview {
    AroundYouMapView()
}
