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
    @State var wastes = [Waste(nome: "Plastic and metals", img: "waterbottle"),
        Waste(nome: "Paper", img: "newspaper"),
        Waste(nome: "Glass", img: "wineglass"),
        Waste(nome: "Organic", img: "leaf"),
        Waste(nome: "Undifferentiated", img: "hand.raised.brakesignal.slash"),
        Waste(nome: "WEEE", img: "powerplug"),
        Waste(nome: "Special waste", img: "atom")]

    var body: some View {
        NavigationStack(){
            List() {
                NavigationLink(destination: PlasticViewUI()){
                    Section{
                        Image(systemName: "waterbottle")
                        Text("Plastic and metals")
                    }
                }
                NavigationLink(destination: PaperViewUI()){
                    Section{
                        Image(systemName: "newspaper")
                        Text("Paper")
                    }
                }
                NavigationLink(destination: GlassPage()){
                    Section{
                        Image(systemName: "wineglass")
                        Text("Glass")
                    }
                }
                NavigationLink(destination: OrganicPage()){
                    Section{
                        Image(systemName: "leaf")
                        Text("Organic")
                    }
                }
                
                NavigationLink(destination: UndifferentiatedPage()){
                    Section{
                        Image(systemName: "hand.raised.brakesignal.slash")
                        Text("Undifferentiated")
                    }
                }
                
                NavigationLink(destination: WEEEPage()){
                    Section{
                        Image(systemName: "powerplug")
                        Text("WEEE")
                    }
                }
                
                NavigationLink(destination: SpecialWastePage()){
                    Section{
                        Image(systemName: "atom")
                        Text("Special Waste")
                    }
                }


            }
        }//.navigationTitle("Throw-it-here list")
    }
}


struct GlassPage: View {
    var body: some View {
        Text("Pagina di vetro")
            .navigationTitle("Glass")
    }
}

struct OrganicPage: View {
    var body: some View {
        Text("Pagina di Organico")
            .navigationTitle("Organic")
    }
}

struct UndifferentiatedPage: View {
    var body: some View {
        Text("Pagina di Indifferenziato")
            .navigationTitle("Undifferentiated")
    }
}

struct WEEEPage: View {
    var body: some View {
        Text("Pagina di Raee")
            .navigationTitle("WEEE")
    }
}

struct SpecialWastePage: View {
    var body: some View {
        Text("Pagina di rifiuti speciali")
            .navigationTitle("Special waste")
    }
}
#Preview {
    ListViewUI()
}
