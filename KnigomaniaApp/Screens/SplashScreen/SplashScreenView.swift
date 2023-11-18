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
			Text("КНИГОМАНИЯ")
				.font(.system(size: 32, weight: .heavy))
				.foregroundColor(CustomColors.darkBrownColor)
			CustomActivityIndicator()
				.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
				.padding(.bottom, 52)
		}
		.ignoresSafeArea()
	}
}

#Preview {
    SplashScreenView()
}
