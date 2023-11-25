//
//  MainConfirmationStep1View.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 25.11.2023.
//
// Исправить текст
import SwiftUI

struct MailConfirmationStep1View: MailConfirmationViewProtocol {
	
	// MARK: Dependencies
	
	var mailConfirmationCoordinator: MailConfirmationCoordinator?
	
	// MARK: Properties
	
	var email: String = "123356@gmail.com"
	@State private var isLoading: Bool = false
	
	// MARK: View
	
	var body: some View {
		ZStack {
			ZStack {
				CustomColors.background
					.ignoresSafeArea()
				VStack {
					Text(TextTitles.MailConfirmStep1.emailConfirm.rawValue)
						.modifier(HeadlineTextModifier())
						.padding(.top, Sizes.Padding.normal.rawValue)
						.padding(.horizontal, Sizes.Padding.small.rawValue)
					Text(TextTitles.MailConfirmStep1.sendMail.rawValue + email)
						.modifier(RegularTextModifier())
						.padding(.top, Sizes.Padding.normal.rawValue)
						.padding(.horizontal, Sizes.Padding.large.rawValue)
					Image(ImageNames.RegOnBoarding2.rawValue)
						.padding(.top, Sizes.Padding.large.rawValue)
						.padding(.horizontal, Sizes.Padding.normal.rawValue)
					VStack(spacing: Sizes.Padding.normal.rawValue){
						Text(TextTitles.MailConfirmStep1.doNotGetMail.rawValue)
							.font(.system(size: 14, weight: .regular))
							.foregroundColor(CustomColors.darkBrownColor)
						Button(action: {
							
						}, label: {
							Text(TextTitles.MailConfirmStep1.sendAgain.rawValue)
								.foregroundStyle(CustomColors.darkBrownColor)
								.font(.system(size: 14, weight: .bold))
						})
					}
					.padding(.top, Sizes.Padding.large.rawValue)
					Spacer()
				}
				.blur(radius: isLoading ? 3 : 0)
				CustomActivityIndicator()
					.opacity(isLoading ? 1 : 0)
			}
			.onAppear(perform: {
				DispatchQueue.main.asyncAfter(deadline: .now() + 2.5){
					isLoading = true
				}
			})
		}
	}
}

// MARK: Preview

#Preview {
	MailConfirmationStep1View()
}


