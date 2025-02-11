//
//  UndifferentiatedView.swift
//  Greenify
//
//  Created by san022 on 11/02/25.
//

import SwiftUI

struct UndifferentiatedView: View {
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
                    Text("What can you throw in undifferentiated bin?")
                        .font(.title)
                        .padding(.top, 20)
                    Text("Sanitary pads, dirty rags, sponges, toothbrushes, rubber objects, disposable cutlery, cigar and cigarette butts, plasticized paper, chewing gum, and vacuum cleaner bags.")
                        .font(.body)
                        .padding(.top, 20)
                }else {
                    Text("What can't you throw in undifferentiated bin?")
                        .font(.title)
                        .padding(.top, 20)
                    Text("All recyclable materials (organic, plastic and metal, paper, cardboard and cardstock, glass), hazardous urban waste, bulky waste, WEEE (Waste from Electrical and Electronic Equipment).")
                        .font(.body)
                        .padding(.top, 20)
                }
            }.padding()
                .navigationTitle("Paper")
            Spacer()
        }
    }
}

#Preview {
    UndifferentiatedView()
}
