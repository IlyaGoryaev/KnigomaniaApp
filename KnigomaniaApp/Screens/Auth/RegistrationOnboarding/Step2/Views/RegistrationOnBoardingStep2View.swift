//
//  RegistrationOnBoardingStep2View.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 12.10.2023.
//

import SwiftUI

struct RegistrationOnBoardingStep2View: RegistrationOnboardingViewProtocol {
	
	// MARK: Dependencies
	
	weak var applicationCoordinator: RegistrationOnboardingCoordinator?
	
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
					Text(TextTitles.RegOnBoarding2.emailConfirm.rawValue)
						.modifier(HeadlineTextModifier())
						.padding(.top, Sizes.Padding.normal.rawValue)
						.padding(.horizontal, Sizes.Padding.small.rawValue)
					Text(TextTitles.RegOnBoarding2.sendMail.rawValue + email)
						.modifier(RegularTextModifier())
						.padding(.top, Sizes.Padding.normal.rawValue)
						.padding(.horizontal, Sizes.Padding.large.rawValue)
					Image(ImageNames.RegOnBoarding2.rawValue)
						.padding(.top, Sizes.Padding.large.rawValue)
						.padding(.horizontal, Sizes.Padding.normal.rawValue)
					VStack(spacing: Sizes.Padding.normal.rawValue){
						Text(TextTitles.RegOnBoarding2.doNotGetMail.rawValue)
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(CustomColors.darkBrownColor)
						Button(action: {
							applicationCoordinator?.route(view: .step3)
						}, label: {
							Text(TextTitles.RegOnBoarding2.sendAgain.rawValue)
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
	RegistrationOnBoardingStep2View()
}


