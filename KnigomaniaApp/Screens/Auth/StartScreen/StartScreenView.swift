//
//  StartScreenView.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 28/9/23.
//

import SwiftUI

struct StartScreenView: View {
	
	// MARK: Dependencies
	
	weak var entryCoordinator: EntryCoordinator?
	
	// MARK: View
	
	var body: some View {
		ZStack {
			CustomColors.background
				.edgesIgnoringSafeArea(.all)
			VStack {
				Image(ImageNames.StartScreenViewImage.rawValue)
					.padding(.top, 89)
				VStack(spacing: 10) {
					Text(TextTitles.StartScreenView.welcome.rawValue)
						.font(.system(size: 24, weight: .bold))
						.foregroundColor(CustomColors.darkBrownColor)
						.frame(maxWidth: .infinity, alignment: .leading)
						.padding(.leading, 17)
					Text(TextTitles.StartScreenView.progress.rawValue)
						.font(.system(size: 16, weight: .regular))
						.foregroundColor(CustomColors.darkBrownColor)
						.frame(maxWidth: .infinity, alignment: .leading)
						.padding(.leading, 17)
				}
				.padding(.top, 58)
				Spacer(minLength: 32)
				ButtonView(title: .continuation, isButtonEnable: true) {
					entryCoordinator?.openRegistrationScreen()
				}
				Spacer()
				VStack(spacing: 24) {
					HStack(spacing: 4) {
						Text("Уже есть аккаунт?")
							.font(.system(size: 14, weight: .regular))
							.foregroundColor(CustomColors.darkBrownColor)
						Button(action: {
							entryCoordinator?.openEntryScreen()
						}) {
							Text("Войти")
								.font(.system(size: 14, weight: .medium))
								.foregroundColor(CustomColors.darkBrownColor)
						}
					}
					// TODO: underline links
					Text("Продолжая, вы соглашаетесь с [правилами использования приложения](https://www.apple.com/) и [политикой конфиденциальности](https://www.apple.com/)")
						.font(.system(size: 11))
						.foregroundColor(CustomColors.beigeColor)
						.accentColor(CustomColors.darkBrownColor)
						.multilineTextAlignment(.center)
				}
				.padding(.horizontal, Sizes.Padding.normal.rawValue)
				Spacer()
			}
		}
	}
}

// MARK: Preview

#Preview {
	StartScreenView()
}
