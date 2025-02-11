//
//  PlasticViewUI.swift
//  Greenify
//
//  Created by GiuseppeRuggiero on 10/02/25.
//

import SwiftUI

struct PlasticViewUI: View {
    @State private var what = 0
    var body: some View {
        NavigationStack{
            VStack {
                Picker("Choose what do you need", selection: $what) {
                    Text("What YES").tag(0)
                    Text("What NO").tag(1)
                }
                .pickerStyle(.segmented)
                if what == 0 {
                    Text("What can you throw in plastic? bin")
                        .font(.title)
                        .padding(.top, 20)
                    Text("Plastic bottles, food and yogurt jars, packaging films and polystyrene, bottles of household and personal hygiene products, disposable cups and glasses, empty plastic and metal cream and toothpaste tubes, blister packs, plastic and metal clothes hangers, cans, boxes, jars, paper and aluminum trays, cartons for drinks and food (milk cartons, fruit juices and similar), empty spray cans.")
                        .font(.body)
                        .padding(.top, 20)
                }else {
                    Text("What can't you throw in plastic bin?")
                        .font(.title)
                        .position(x: 185, y: 50)
                    Text("Bulky plastic goods (basins and buckets), toys, household appliances and their parts, containers of glue, enamel and paint, disposable plastic cutlery, rubber objects, CDs, DVDs, video cassettes including external containers, plastic and/or rubber pipes, cables and elements of electrical systems, films and photographic plates.")
                        .font(.body)
                        .position(x: 185, y: -30)
                }
            }.padding()
                //.navigationTitle("Plastic" (systemName: "bottle"))
            Spacer()
        }
    }
}

#Preview {
    PlasticViewUI()
}
