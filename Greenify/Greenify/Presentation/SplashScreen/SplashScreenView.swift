//
//  SplashScreenView.swift
//  Greenify
//
//  Created by san016 on 12/02/25.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false

    var body: some View {
        if isActive {
            StartupTabView()
        } else {
            VStack {
                Image(.appLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)

            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}
