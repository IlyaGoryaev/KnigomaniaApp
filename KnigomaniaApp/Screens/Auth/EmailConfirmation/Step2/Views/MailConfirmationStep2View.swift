//
//  MailConfirmationStep2View.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 25.11.2023.
//
// Исправить текст
import SwiftUI

struct MailConfirmationStep2View: MailConfirmationViewProtocol {
	
	// MARK: Dependencies
	
	var mailConfirmationCoordinator: MailConfirmationCoordinator?
	
	// MARK: View
	
	var body: some View {
		ZStack{
			CustomColors.background
				.ignoresSafeArea()
			VStack(spacing: Sizes.Padding.zero.rawValue) {
				Text(TextTitles.RegOnBoarding3.emailConfirmed.rawValue)
					.modifier(HeadlineTextModifier())
					.padding(.top, Sizes.Padding.large.rawValue)
					.padding(.horizontal, Sizes.Padding.large.rawValue)
				ButtonView(title: .continuation, isButtonEnable: true){

				}
				.padding(.top, Sizes.Padding.large.rawValue)
				Spacer()
			}
		}
	}
}

// MARK: Preview

#Preview {
	RegistrationOnboardingStep3View()
}
