//
//  ContentView.swift
//  Greenify
//
//  Created by GiuseppeRuggiero on 07/02/25.
// SPLASH ART

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
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
}

struct ThirdView: View {
    var body: some View {
        NavigationLink(destination: ThirdView()) {
            HStack {
                Text("Communications")
                    .font(.largeTitle)
            }
        }
    }
}


#Preview {
    ContentView()
}
