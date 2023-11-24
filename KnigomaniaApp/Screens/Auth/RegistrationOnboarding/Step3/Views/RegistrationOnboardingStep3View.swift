//
//  RegistrationOnboardingStep3View.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 26.09.2023.
//

import SwiftUI

struct RegistrationOnboardingStep3View: RegistrationOnboardingViewProtocol {
	
	// MARK: Dependencies
	
	weak var applicationCoordinator: RegistrationOnboardingCoordinator?
	
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
					applicationCoordinator?.route(view: .step4)
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
