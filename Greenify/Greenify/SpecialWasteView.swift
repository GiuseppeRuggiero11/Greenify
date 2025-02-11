//
//  SpecialWasteView.swift
//  Greenify
//
//  Created by san022 on 11/02/25.
//

import SwiftUI

struct SpecialWasteView: View {
    @State private var what = 0
    var body: some View {
        NavigationStack{
            VStack {
                Picker("Choose what do you need", selection: $what) {
                    Text("NOT dangerous").tag(0)
                    Text("Dangerous").tag(1)
                }
                .pickerStyle(.segmented)
                if what == 0 {
                    Text("What can be recycled in special waste (not dangerous)?")
                        .font(.title)
                        .padding(.top, 20)
                    Text("1. Waste produced in the context of agricultural, agro-industrial, forestry and fishing activities.\n2. Waste produced by construction and demolition activities, as well as waste resulting from excavation activities.\n3. Waste produced in the context of industrial processes;\n4. waste produced in the context of artisanal processes;\n5. waste produced in the context of commercial activities;\n6. waste produced in the context of service activities;\n7. waste resulting from waste recovery and disposal activities, sludge produced by purification and other water treatments and wastewater purification, as well as waste from smoke abatement, septic tanks and sewerage systems;\n9. waste resulting from healthcare activities;\n10. end-of-life vehicles. ")
                        .font(.body)
                        .padding(.top, 20)
                }else {
                    Text("What can be recycled in special waste (dangerous)?")
                        .font(.title)
                        .padding(.top, 20)
                    Text("Explosive waste, oxidising waste, flammable waste, irritant waste — skin irritation and eye damage, Specific Target Organ Toxicity (STOT)/Aspiration Toxicity waste, Acute Toxicity waste, Carcinogenic waste, Corrosive waste, Infectious waste, Reproductive Toxicity waste, Acute Toxicity Gas Release Waste, Sensitising waste, Ecotoxic waste, Waste not directly possessing one of the hazardous properties")
                        .font(.body)
                        .padding(.top, 20)
                }
            }.padding()
                .navigationTitle("Special waste")
            Spacer()
        }
    }}

#Preview {
    SpecialWasteView()
}
