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
                Text("КНИГОМАНИЯ")
                    .font(.system(size: 32, weight: .heavy))
                    .foregroundColor(CustomColors.yellowColor)
                    .padding(.top, 343)
                CustomActivityIndicator()
                    .padding(.top, 290)
                Spacer()
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
