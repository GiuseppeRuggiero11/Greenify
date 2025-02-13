//
//  SplashArtView.swift
//  Greenify
//
//  Created by GiuseppeRuggiero on 07/02/25.
//Prova_branch
//

import SwiftUI

struct SplashArtView: View {
    var body: some View {
        ZStack {
            Color.white
            HStack(spacing: 5) {
                Image(.gAppIcon)
                    .resizable()
                    .frame(width: 130, height: 130)
                    .foregroundColor(.green)
                
                Text("reenify")
                    .font(.system(size: 70, weight: .bold))
                    .foregroundColor(.appIconGreen)
            }
        }
    }
}

#Preview {
    SplashArtView()
}
