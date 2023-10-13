//
//  SplashScreenView.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 28/9/23.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack {
            CustomColors.background
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Text("КНИГОМАНИЯ")
                    .font(.system(size: 32, weight: .heavy))
                    .foregroundColor(CustomColors.darkBrownColor)
                CustomActivityIndicator()
                    .padding(.top, 287)
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
