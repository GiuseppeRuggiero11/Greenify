//
//  ListViewUI.swift
//  Greenify
//
//  Created by GiuseppeRuggiero on 07/02/25.
//

import SwiftUI

struct Waste: Identifiable {
    var id = UUID()
    var nome: String
    var img: String
}

struct ListViewUI: View {
    @State var wastes = [
        Waste(nome: "Plastic and metals", img: "waterbottle"),
        Waste(nome: "Paper", img: "newspaper"),
        Waste(nome: "Glass", img: "wineglass"),
        Waste(nome: "Organic", img: "leaf"),
        Waste(nome: "Undifferentiated", img: "hand.raised.brakesignal.slash"),
        Waste(nome: "WEEE", img: "powerplug"),
        Waste(nome: "Special waste", img: "atom"),
    ]

    var body: some View {

        NavigationStack {
            List {
                NavigationLink(destination: PlasticViewUI()) {
                    Section {
                        Image(systemName: "waterbottle")
                        Text("Plastic and metals")
                    }
                }
                NavigationLink(destination: PaperViewUI()) {
                    Section {
                        Image(systemName: "newspaper")
                        Text("Paper")
                    }
                }
                NavigationLink(destination: GlassView()) {
                    Section {
                        Image(systemName: "wineglass")
                        Text("Glass")
                    }
                }
                NavigationLink(destination: OrganicView()) {
                    Section {
                        Image(systemName: "leaf")
                        Text("Organic")
                    }
                }

                NavigationLink(destination: UndifferentiatedView()) {
                    Section {
                        Image(systemName: "hand.raised.brakesignal.slash")
                        Text("Undifferentiated")
                    }
                }

                NavigationLink(destination: WEEEView()) {
                    Section {
                        Image(systemName: "powerplug")
                        Text("WEEE")
                    }
                }

                NavigationLink(destination: SpecialWasteView()) {
                    Section {
                        Image(systemName: "atom")
                        Text("Special Waste")
                    }
                }
            }.toolbarTitleDisplayMode(.inline).toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Throw it here").font(.system(size: 22))
                }
            }
        }
    }
}

#Preview {
    ListViewUI()
}
