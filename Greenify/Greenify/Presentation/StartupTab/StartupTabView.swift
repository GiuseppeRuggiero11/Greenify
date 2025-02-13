//
//  ContentView.swift
//  Greenify
//
//  Created by GiuseppeRuggiero on 07/02/25.
// SPLASH ART

import SwiftUI

struct StartupTabView: View {
    var body: some View {
        TabView {
            Tab("Around You", systemImage: "network") {
                AroundYouMapView()
            }
            Tab("Throw it here", systemImage: "basket") {
                ListViewUI()
            }
            Tab("Communications", systemImage: "envelope") {
                CommunicationsUIView()
            }
        }
    }
}

#Preview {
    StartupTabView()
}
