//
//  OrganicView.swift
//  Greenify
//
//  Created by san022 on 11/02/25.
//

import SwiftUI

struct OrganicView: View {
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
                    Text("What can you throw in glass bin?")
                        .font(.title)
                        .padding(.top, 20)
                    Text("Vegetable and animal kitchen scraps, eggshells, coffee and tea grounds, acid-soiled paper napkins, twigs, dried leaves, small pruning waste (diameter less than 5 cm), cork stoppers, compostable litter.")
                        .font(.body)
                        .padding(.top, 20)
                }else {
                    Text("What can't you throw in glass bin?")
                        .font(.title)
                        .padding(.top, 20)
                    Text("Synthetic litter, sanitary napkins and diapers, used oils, pruning branches (diameter greater than 5 cm), cigar and cigarette butts, dust and vacuum cleaner bags, chewing gum.")
                        .font(.body)
                        .padding(.top, 20)
                }
            }.navigationTitle("Organic")
            Spacer()
        }.padding()
    }
}

#Preview {
    OrganicView()
}
