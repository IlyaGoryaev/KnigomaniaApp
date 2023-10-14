//
//  RegistrationOnBoardingStep2View.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 12.10.2023.
//

import SwiftUI

struct RegistrationOnBoardingStep2View: View {
	
	var applicationCoordinator: ApplicationCoordinator?
	var email: String = "123356gmail.com"
	
	var body: some View {
		ZStack{
			CustomColors.background
				.ignoresSafeArea()
			
			VStack{
				Text("Подтвердите адрес электронной почты")
					.modifier(HeadlineTextModifier())
					.padding(.top, 88)
					.padding(.horizontal, 8)
				Text("Мы отправили письмо на " + email)
					.modifier(RegularTextModifier())
					.padding(.top, 24)
					.padding(.horizontal, 60)
				Image("RegistrationStep2Image")
					.resizable()
					.frame(height: 343)
					.padding(.top, 32)
					.padding(.horizontal, 16)
				VStack(spacing: 16){
					Text("Не получили письмо?")
						.modifier(RegularTextModifier())
					Button(action: {
						applicationCoordinator?.openStep3()
					}, label: {
						Text("Отправить еще раз")
							.foregroundStyle(CustomColors.darkBrownColor)
							.font(.system(size: 14, weight: .bold))
					})
				}
				.padding(.top, 32)
				Spacer()
			}
		}
	}
}

#Preview {
    RegistrationOnBoardingStep2View()
}
