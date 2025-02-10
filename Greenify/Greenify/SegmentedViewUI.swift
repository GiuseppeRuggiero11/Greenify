//
//  SegmentedViewUI.swift
//  Greenify
//
//  Created by GiuseppeRuggiero on 07/02/25.
//

import SwiftUI

struct SegmentedViewUI: View {
    @State private var what = 0
    var body: some View {
        VStack {
            Picker("Choose what do you need", selection: $what) {
                Text("What YES").tag(0)
                Text("What NO").tag(1)
            }
            .pickerStyle(.segmented)
            if what == 0 {
                Text("You selected YES")
            } else {
                Text("You selected NO")
            }
            Spacer()
        }.padding()
    }
}

#Preview {
    SegmentedViewUI()
}
