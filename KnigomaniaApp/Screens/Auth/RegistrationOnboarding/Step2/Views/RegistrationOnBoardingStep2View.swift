//
//  RegistrationOnBoardingStep2View.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 12.10.2023.
//

import SwiftUI

struct RegistrationOnBoardingStep2View: RegistrationOnboardingViewProtocol {
	weak var applicationCoordinator: RegistrationOnboardingCoordinator?
	var email: String = "123356gmail.com"
	@State private var isLoading: Bool = false
	
	var body: some View {
		ZStack {
			ZStack {
				CustomColors.background
					.ignoresSafeArea()
				VStack {
					Text("Подтвердите адрес электронной почты")
						.modifier(HeadlineTextModifier())
						.padding(.top, 20)
						.padding(.horizontal, 8)
					Text("Мы отправили письмо на " + email)
						.modifier(RegularTextModifier())
						.padding(.top, 18)
						.padding(.horizontal, 60)
					Image("selfie")
						.padding(.top, 51)
						.padding(.horizontal, 16)
					VStack(spacing: 16){
						Text("Не получили письмо?")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(CustomColors.darkBrownColor)
						Button(action: {
							applicationCoordinator?.route(view: .step3)
						}, label: {
							Text("Отправить еще раз")
								.foregroundStyle(CustomColors.darkBrownColor)
								.font(.system(size: 14, weight: .bold))
						})
					}
					.padding(.top, 72)
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

#Preview {
	RegistrationOnBoardingStep2View()
}


