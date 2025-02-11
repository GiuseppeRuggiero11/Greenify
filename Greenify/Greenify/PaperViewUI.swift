//
//  PaperViewUI.swift
//  Greenify
//
//  Created by san022 on 10/02/25.
//

import SwiftUI

struct PaperViewUI: View {
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
                    Text("What can you throw in paper bin?")
                        .font(.title)
                        .padding(.top, 20)
                    Text("Notebooks, books, magazines and newspapers, advertising flyers, cardboard boxes, cardboard boxes, unsoiled pizza boxes, drawing or copy paper.")
                        .font(.body)
                        .padding(.top, 20)
                }else {
                    Text("What can't you throw in paper bin?")
                        .font(.title)
                        .padding(.top, 20)
                    Text("Notebooks, books, magazines and newspapers, advertising flyers, cardboard boxes, cardboard boxes, unsoiled pizza boxes, drawing or copy paper.")
                        .font(.body)
                        .padding(.top, 20)
                }
            }.navigationTitle("Paper")
            Spacer()
        }.padding()
    }
}

#Preview {
    PaperViewUI()
}
