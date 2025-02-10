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
                    CustomMapView()
                }
                Tab("Throw it here", systemImage: "basket") {
                    SecondView()
                }
                Tab("Communications", systemImage: "envelope") {
                    ThirdView()
                }
            }
        }
    }
}

struct FirstView: View {
    var body: some View {
        NavigationLink(destination: ThirdView()) {
            HStack {
                Text("Around you")
                    .font(.largeTitle)
            }
        }
    }
}

struct SecondView: View {
    var body: some View {
        NavigationLink(destination: SecondView()) {
            HStack {
                Text("Throw it here")
                    .font(.largeTitle)
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
