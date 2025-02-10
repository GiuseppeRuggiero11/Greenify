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
        Waste(nome: "Glass", img: "tram"),
        Waste(nome: "Organic", img: "wineglass"),
        Waste(nome: "Undifferentiated", img: "leaf"),
        Waste(nome: "WEEE", img: "powerplug"),
        Waste(nome: "Special waste", img: "atom"),
    ]
    @State private var searchText = ""
    var body: some View {
        List(wastes) { Waste in
            HStack{
                Image(systemName: Waste.img)
                    Text(Waste.nome)
            }
        }
    }
}


#Preview {
    ListViewUI()
}
