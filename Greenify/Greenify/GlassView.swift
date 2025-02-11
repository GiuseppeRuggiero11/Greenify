//
//  GlassView.swift
//  Greenify
//
//  Created by san022 on 11/02/25.
//

import SwiftUI

struct GlassView: View {
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
                    Text("Empty glass bottles, jars and cans of their contents and remove any easily removable packaging accessories.")
                        .font(.body)
                        .padding(.top, 20)
                }else {
                    Text("What can't you throw in glass bin?")
                        .font(.title)
                        .padding(.top, 20)
                    Text("Plates, mirrors and all those glass objects that are not packaging, glasses and crystal objects, ceramics and porcelain, pyrex, light bulbs and neon, tubes and TV screens, computer monitors.")
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
    GlassView()
}
